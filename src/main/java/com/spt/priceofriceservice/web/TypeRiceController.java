package com.spt.priceofriceservice.web;
import com.spt.priceofriceservice.domain.TypeRice;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = TypeRice.class)
@Controller
@RequestMapping("/typerices")
@RooWebScaffold(path = "typerices", formBackingObject = TypeRice.class)
public class TypeRiceController {
}
