package ourmarket.alipay.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ourmarket.alipay.config.AlipayConfig;
import ourmarket.alipay.util.AlipayNotify;
import ourmarket.alipay.util.AlipaySubmit;
/**
 * 
 * @author Admin_YangD
 * @date  2017年5月1日
 */
@Controller
@RequestMapping("aliPay")
public class AliPayController {
    @RequestMapping("open")  
    public ResponseEntity<HttpEntity> open(Model model, String WIDout_trade_no, String WIDsubject, String WIDtotal_fee,  
            String WIDbody) {  
      
        //////////////////////////////////// 请求参数//////////////////////////////////////  
      
        // 商户订单号，商户网站订单系统中唯一订单号，必填  
        String out_trade_no = WIDout_trade_no;  
        // 订单名称，必填  
        String subject = WIDsubject;  
        // 付款金额，必填  
        String total_fee = WIDtotal_fee;  
        // 商品描述，可空  
        String body = WIDbody;  
      
        // 把请求参数打包成数组  
        Map<String, String> sParaTemp = new HashMap<String, String>();  
        sParaTemp.put("service", AlipayConfig.service);  
        sParaTemp.put("partner", AlipayConfig.partner);  
        sParaTemp.put("seller_id", AlipayConfig.seller_id);  
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);  
        sParaTemp.put("payment_type", AlipayConfig.payment_type);  
        sParaTemp.put("notify_url", AlipayConfig.notify_url);  
        sParaTemp.put("return_url", AlipayConfig.return_url);  
        sParaTemp.put("anti_phishing_key", AlipayConfig.anti_phishing_key);  
        sParaTemp.put("exter_invoke_ip", AlipayConfig.exter_invoke_ip);  
        sParaTemp.put("out_trade_no", out_trade_no);  
        sParaTemp.put("subject", subject);  
        sParaTemp.put("total_fee", total_fee);  
        sParaTemp.put("body", body);  
        // 其他业务参数根据在线开发文档，添加参数.文档地址:https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.O9yorI&treeId=62&articleId=103740&docType=1  
        // 如sParaTemp.put("参数名","参数值");  
      
        // 建立请求  
        String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "get", "确认");  
        model.addAttribute("sHtmlText", sHtmlText);  
      
        
        // 保存支付记录  此处有问题，要改
        //hysWebMeetingAliService.insertSelective(sParaTemp);  
        
        
        return new ResponseEntity(model, HttpStatus.OK);  
    }  

    
    @RequestMapping("notifyUrl")  
    @ResponseBody  
    public String notify(HttpServletRequest request){  
        //获取支付宝POST过来反馈信息  
        Map<String,String> params = new HashMap<String,String>();  
        Map requestParams = request.getParameterMap();  
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {  
            String name = (String) iter.next();  
            String[] values = (String[]) requestParams.get(name);  
            String valueStr = "";  
            for (int i = 0; i < values.length; i++) {  
                valueStr = (i == values.length - 1) ? valueStr + values[i]  
                        : valueStr + values[i] + ",";  
            }  
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化  
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");  
            params.put(name, valueStr);  
        }  
          
        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//  
        //商户订单号  
      
        String out_trade_no = request.getParameter("out_trade_no");  
      
        //支付宝交易号  
      
        String trade_no = request.getParameter("trade_no");  
      
        //交易状态  
        String trade_status = request.getParameter("trade_status");  
      
        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//  
      
        if(AlipayNotify.verify(params)){//验证成功  
            //////////////////////////////////////////////////////////////////////////////////////////  
            //请在这里加上商户的业务逻辑程序代码  
      
            //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——  
            boolean flg = false;  
            if(trade_status.equals("TRADE_FINISHED")){  
                //判断该笔订单是否在商户网站中已经做过处理  
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序  
                    //请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的  
                    //如果有做过处理，不执行商户的业务程序  
                      
                //注意：  
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知  
            } else if (trade_status.equals("TRADE_SUCCESS")){  
                //判断该笔订单是否在商户网站中已经做过处理  
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序  
                    //请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的  
                    //如果有做过处理，不执行商户的业务程序  
                      
                //注意：  
                //付款完成后，支付宝系统发送该交易状态通知  
                  
            	
            	
                //根据订单号将订单状态和支付宝记录表中状态都改为已支付  有问题，要改
               //flg = hysWebMeetingAliService.changeOrderAndAliStatusSuccess(out_trade_no);  
                  
               
               
            }  
      
            //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——  
                  
            //out.print("success"); //请不要修改或删除  
            if(flg){  
                return "success";  
            }else{  
                return "fail";  
            }  
      
            //////////////////////////////////////////////////////////////////////////////////////////  
        }else{//验证失败  
            //out.print("fail");  
            return "fail";  
        }  
    }   
    
    @RequestMapping("returnUrl")  
    public ModelAndView returnUrl(HttpServletRequest request){  
    	//重定向到我们想到的url处
        ModelAndView mv = new ModelAndView("redirect:/meeting/info");  
          
        //获取支付宝GET过来反馈信息  
        Map<String,String> params = new HashMap<String,String>();  
        Map requestParams = request.getParameterMap();  
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {  
            String name = (String) iter.next();  
            String[] values = (String[]) requestParams.get(name);  
            String valueStr = "";  
            for (int i = 0; i < values.length; i++) {  
                valueStr = (i == values.length - 1) ? valueStr + values[i]  
                        : valueStr + values[i] + ",";  
            }  
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化  
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");  
            params.put(name, valueStr);  
        }  
          
        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//  
        //商户订单号  
  
        String out_trade_no = request.getParameter("out_trade_no");  
  
        //支付宝交易号  
  
        String trade_no = request.getParameter("trade_no");  
  
        //交易状态  
        String trade_status = request.getParameter("trade_status");  
          
        //<span style="color:#ff0000;">String meetingId = request.getParameter("extra_common_param");  
        //mv.addObject("meetingId", meetingId);</span>  
  
        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//  
          
        //计算得出通知验证结果  
        boolean verify_result = AlipayNotify.verify(params);  
          
        if(verify_result){//验证成功  
            //////////////////////////////////////////////////////////////////////////////////////////  
            //请在这里加上商户的业务逻辑程序代码  
  
            //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——  
            if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){  
                //判断该笔订单是否在商户网站中已经做过处理  
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序  
                    //如果有做过处理，不执行商户的业务程序  
            }  
              
            //该页面可做页面美工编辑  
//          out.println("验证成功<br />");  
            //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——  
  
            //////////////////////////////////////////////////////////////////////////////////////////  
        }else{  
            //该页面可做页面美工编辑  
//          out.println("验证失败");  
        }  
          
        return mv;  
    }  
}
