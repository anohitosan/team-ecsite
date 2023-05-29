package jp.co.internous.valhalla.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.co.internous.valhalla.model.domain.MstCategory;
import jp.co.internous.valhalla.model.domain.MstProduct;
import jp.co.internous.valhalla.model.form.SearchForm;
import jp.co.internous.valhalla.model.mapper.MstCategoryMapper;
import jp.co.internous.valhalla.model.mapper.MstProductMapper;
import jp.co.internous.valhalla.model.session.LoginSession;

/**
 * 商品検索に関する処理を行うコントローラー
 * @author インターノウス
 *
 */
@Controller
@RequestMapping("/valhalla")
public class IndexController {
	
	@Autowired
	private MstProductMapper productMapper;
	
	@Autowired
	private MstCategoryMapper categoryMapper;
	
	@Autowired
	private LoginSession loginSession;
	
	/**
	 * トップページを初期表示する。
	 * @param m 画面表示用オブジェクト
	 * @return トップページ
	 */
	@RequestMapping("/")
	public String index(Model m) {
		//未ログイン、かつ仮IDが初期値の場合(0)にランダムな数値を仮IDに設定する。
		if(!loginSession.isLogined() && loginSession.getTmpUserId() == 0) {
			int randomNumber = new Random().nextInt(999_999_999) + 1;
			loginSession.setTmpUserId(randomNumber);
		}
		
		//Index.htmlで必要な情報を送る。
		List<MstProduct> products = productMapper.find();
		List<MstCategory> categories = categoryMapper.find();
		m.addAttribute("products", products);
		m.addAttribute("categories", categories);
		m.addAttribute("loginSession", loginSession);
		return "index";
	}
	
	/**
	 * 検索処理を行う
	 * @param f 検索用フォーム
	 * @param m 画面表示用オブジェクト
	 * @return トップページ
	 */
	@GetMapping("/searchItem")
	public String searchItem(SearchForm f, Model m) {
		
		//検索ワードから全角、2個以上のスペースを半角スペースにする。また文の前後の空白をなくす。
		String keywords = f.getKeywords().replaceAll("　", " ").replaceAll("\\s{2,}", " ").trim();
		List<MstCategory> categories = categoryMapper.find();
		
		//nullで初期化
		List<MstProduct> products = null;
		
		//検索時にカテゴリーが指定されているかどうかで処理を分岐する。
		if(f.getCategory() == 0) {
			products = productMapper.findByProductName(keywords.split(" "));
		} else {
			products = productMapper.findByCategoryAndProductName(f.getCategory(), keywords.split(" "));
		}
		
		//Index.htmlで必要な情報を送る。
		m.addAttribute("selected",f.getCategory());
		m.addAttribute("keywords", keywords);
		m.addAttribute("products", products);
		m.addAttribute("categories", categories);
		m.addAttribute("loginSession", loginSession);
		return "index";
	}
}
