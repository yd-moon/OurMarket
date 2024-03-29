package ourmarket.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ourmarket.models.Goods;
import ourmarket.pojos.GoodsInfo;
import ourmarket.services.IGoodService;
import ourmarket.services.IImageLibraryService;
import ourmarket.services.IUserService;

@Controller
public class SearchControl {
	@Autowired
	IGoodService iGoodService=null;
	@Autowired
	IImageLibraryService imgLibraryService=null;
	@Autowired
	IUserService iUserService=null;
	
	@RequestMapping("searchGoods")
	public String search(HttpServletRequest request,Model model,String searchInfo){
		int circleInfo=tryNmae(searchInfo);
		List<Goods>goods=iGoodService.findAllGoods();
		List<GoodsInfo>goodsInfos=new ArrayList<GoodsInfo>();
		for(Goods good:goods){
			if(circleInfo!=0){//先判断是否搜索方式为搜索圈子
				if(good.getGlocation()==circleInfo){//返回圈子内物品
					GoodsInfo goodsInfo=new GoodsInfo();
					goodsInfo.setName(good.getGname());
					goodsInfo.setImagesrc(imgLibraryService.findImageId(good.getImageListId()).getImageSrc());
					goodsInfo.setPrice(good.getGprice());
					goodsInfo.setgMasterID(good.getUid());
					goodsInfo.setGid(good.getGid());
					goodsInfo.setgMasterName(iUserService.findUserById(good.getUid()).getUnickName());
					goodsInfos.add(goodsInfo);
					model.addAttribute("goodsInfos", goodsInfos);
				}
			}else{//匹配物品信息
				if(good.getGname().contains(searchInfo)||good.getGtitle().contains(searchInfo)){
					GoodsInfo goodsInfo=new GoodsInfo();
					goodsInfo.setName(good.getGname());
					goodsInfo.setImagesrc(imgLibraryService.findImageId(good.getImageListId()).getImageSrc());
					goodsInfo.setPrice(good.getGprice());
					goodsInfo.setgMasterID(good.getUid());
					goodsInfo.setgMasterName(iUserService.findUserById(good.getUid()).getUnickName());
					goodsInfos.add(goodsInfo);
					model.addAttribute("goodsInfos", goodsInfos);
				}
			}
		}
		if(goodsInfos.size()<1){
			for (int i = 0; i < 15; i++) {
				GoodsInfo goodsInfo=new GoodsInfo();
				goodsInfo.setName(goods.get(i).getGname());
				goodsInfo.setImagesrc(imgLibraryService.findImageId(goods.get(i).getImageListId()).getImageSrc());
				goodsInfo.setPrice(goods.get(i).getGprice());
				goodsInfo.setgMasterID(goods.get(i).getUid());
				goodsInfo.setgMasterName(iUserService.findUserById(goods.get(i).getUid()).getUnickName());
				goodsInfos.add(goodsInfo);
				model.addAttribute("goodsInfos", goodsInfos);
			}
		}
		
		
		return "searchGoods";
	}
	
	/**
	 * @author FCmmmmmm
	 * @param 判断是否搜寻圈子
	 * */
	public int tryNmae(String str) {
		int circle;
		switch (str) {
		case"银杏":circle=1;break;
		case"珙桐":circle=2;break;
		case"芙蓉":circle=3;break;
		case"松林":circle=4;break;
		case"香樟":circle=5;break;
		case"北苑":circle=6;break;
		default: circle=1;
			break;
		}
		return  circle;
	}
}
