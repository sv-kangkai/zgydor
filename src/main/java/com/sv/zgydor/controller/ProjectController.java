package com.sv.zgydor.controller;

import com.sv.zgydor.pojo.TCenunitTreeEntity;
import com.sv.zgydor.service.TCenunitTreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProjectController {

    @Autowired
    private TCenunitTreeService tCenunitTreeService;

    /**
     * 测试方法
     * @return 返回一个测试页面
     */
    @RequestMapping(value = "/projectIndex", method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("/project/project");
    }

    @RequestMapping(value = "/getInitData", method = RequestMethod.GET)
    public @ResponseBody List<TCenunitTreeEntity> findInitData(){
        List<TCenunitTreeEntity> list =  this.tCenunitTreeService.findInitData();
        return list;
    }
}