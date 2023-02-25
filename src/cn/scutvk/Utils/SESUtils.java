package cn.scutvk.Utils;

import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.profile.ClientProfile;
import com.tencentcloudapi.common.profile.HttpProfile;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.ses.v20201002.SesClient;
import com.tencentcloudapi.ses.v20201002.models.*;

public class SESUtils {
    public static void SendConfirmRegisterEmail (String toemali, String username, String confirmid) {
        try{
            // 实例化一个认证对象，入参需要传入腾讯云账户secretId，secretKey,此处还需注意密钥对的保密
            // 密钥可前往https://console.cloud.tencent.com/cam/capi网站进行获取
            Credential cred = new Credential("[your id]", "[your key]");
            // 实例化一个http选项，可选的，没有特殊需求可以跳过
            HttpProfile httpProfile = new HttpProfile();
            httpProfile.setEndpoint("ses.tencentcloudapi.com");
            // 实例化一个client选项，可选的，没有特殊需求可以跳过
            ClientProfile clientProfile = new ClientProfile();
            clientProfile.setHttpProfile(httpProfile);
            // 实例化要请求产品的client对象,clientProfile是可选的
            SesClient client = new SesClient(cred, "ap-hongkong", clientProfile);
            // 实例化一个请求对象,每个接口都会对应一个request对象
            SendEmailRequest req = new SendEmailRequest();
            req.setFromEmailAddress("robot@market.scutvk.cn");
            req.setReplyToAddresses("hwjho@qq.com");

            String[] destination1 = {toemali};
            req.setDestination(destination1);

            Template template1 = new Template();
            template1.setTemplateID(59363L);
            template1.setTemplateData("{\"username\":\"" + username + "\",\"confirmid\":\"" + confirmid + "\"}");
            req.setTemplate(template1);

            req.setSubject("注册验证");
            req.setUnsubscribe("0");
            req.setTriggerType(1L);
            // 返回的resp是一个SendEmailResponse的实例，与请求对象对应
            SendEmailResponse resp = client.SendEmail(req);
            // 输出json格式的字符串回包
            System.out.println(SendEmailResponse.toJsonString(resp));
        } catch (TencentCloudSDKException e) {
            System.out.println(e.toString());
        }
    }

    public static void SendBuySuccessfullyEmail (String toemali, String username, String orderdate, String imgname) {
        try{
            // 实例化一个认证对象，入参需要传入腾讯云账户secretId，secretKey,此处还需注意密钥对的保密
            // 密钥可前往https://console.cloud.tencent.com/cam/capi网站进行获取
            Credential cred = new Credential("[your id]", "[your key]");
            // 实例化一个http选项，可选的，没有特殊需求可以跳过
            HttpProfile httpProfile = new HttpProfile();
            httpProfile.setEndpoint("ses.tencentcloudapi.com");
            // 实例化一个client选项，可选的，没有特殊需求可以跳过
            ClientProfile clientProfile = new ClientProfile();
            clientProfile.setHttpProfile(httpProfile);
            // 实例化要请求产品的client对象,clientProfile是可选的
            SesClient client = new SesClient(cred, "ap-hongkong", clientProfile);
            // 实例化一个请求对象,每个接口都会对应一个request对象
            SendEmailRequest req = new SendEmailRequest();
            req.setFromEmailAddress("robot@market.scutvk.cn");
            req.setReplyToAddresses("hwjho@qq.com");

            String[] destination1 = {toemali};
            req.setDestination(destination1);

            Template template1 = new Template();
            template1.setTemplateID(59364L);
            template1.setTemplateData("{\"username\":\"" + username + "\",\"orderdate\":\"" + orderdate + "\",\"imgname\":\"" + imgname + "\"}");
            req.setTemplate(template1);

            req.setSubject("购买成功");
            req.setUnsubscribe("0");
            req.setTriggerType(1L);
            // 返回的resp是一个SendEmailResponse的实例，与请求对象对应
            SendEmailResponse resp = client.SendEmail(req);
            // 输出json格式的字符串回包
            System.out.println(SendEmailResponse.toJsonString(resp));
        } catch (TencentCloudSDKException e) {
            System.out.println(e.toString());
        }
    }
}