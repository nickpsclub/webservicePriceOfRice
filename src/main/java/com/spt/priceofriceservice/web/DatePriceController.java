package com.spt.priceofriceservice.web;
import com.spt.priceofriceservice.domain.DatePrice;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = DatePrice.class)
@Controller
@RequestMapping("/dateprices")
@RooWebScaffold(path = "dateprices", formBackingObject = DatePrice.class)
public class DatePriceController {
}
