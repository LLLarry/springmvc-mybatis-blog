package com.larry.controller;

import com.larry.pojo.User;
import com.larry.service.UserServiceImpl;
import com.larry.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
@author larry
@create 2021-03-06 11:46
*/
@Controller
public class FileController {
    @Autowired
    private UserServiceImpl userServiceImpl;
    /**
     * 上传头像
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/upload/avatar")
    @ResponseBody
    public Map<String, Object> fileUpload(String id, @RequestParam("file") CommonsMultipartFile file , HttpServletRequest request) throws IOException {
        int uid = WebUtils.parseInt(id, 0);
        System.out.println("id==="+id+"===="+"uid==="+uid);
        HashMap<String, Object> map = new HashMap<>();
        //获取文件名 : file.getOriginalFilename();
        String uploadFileName = file.getOriginalFilename();

        //如果文件名为空，直接回到首页！
        if ("".equals(uploadFileName)){
            map.put("code", 400);
            return map;
        }
        System.out.println("上传文件名 : "+uploadFileName);
        //上传路径保存设置
        String path = request.getServletContext().getRealPath("/upload");
        //如果路径不存在，创建一个
        File realPath = new File(path);
        if (!realPath.exists()){
            realPath.mkdir();
        }
        System.out.println("上传文件保存地址："+realPath);

        InputStream is = file.getInputStream(); //文件输入流
        OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流

        //读取写出
        int len=0;
        byte[] buffer = new byte[1024];
        while ((len=is.read(buffer))!=-1){
            os.write(buffer,0,len);
            os.flush();
        }
        os.close();
        is.close();
        String returnPath = "/upload/"+uploadFileName;
        int i = userServiceImpl.updateAvatarById(uid, returnPath);
        map.put("code", 0);
        map.put("msg", "上传成功");
        HashMap<String, Object> data = new HashMap<>();
        data.put("src", returnPath);
        map.put("data", data);
        return map;
    }

    @RequestMapping("/delete/avatar")
    @ResponseBody
    public Map<String, Object> deletefile (String id, String avatarPath,HttpServletRequest request) {
        int uid = WebUtils.parseInt(id, 0);
        HashMap<String, Object> map = new HashMap<>();
        String path = request.getServletContext().getRealPath("/");
        System.err.println("path====>"+path);
        File file = new File(path, avatarPath);
        // 存在文件
        if (file.exists()) {
            file.delete();
        }
        int i = userServiceImpl.updateAvatarById(uid, null);
        map.put("code", 200);
        map.put("msg", "删除成功");
        return map;
    }
}
