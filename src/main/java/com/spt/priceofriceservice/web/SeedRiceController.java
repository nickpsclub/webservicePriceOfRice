package com.spt.priceofriceservice.web;
import com.spt.priceofriceservice.domain.SeedRice;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = SeedRice.class)
@Controller
@RequestMapping("/seedrices")
@RooWebScaffold(path = "seedrices", formBackingObject = SeedRice.class)
public class SeedRiceController {
}
