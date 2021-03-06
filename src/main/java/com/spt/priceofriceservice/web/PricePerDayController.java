package com.spt.priceofriceservice.web;
import com.spt.priceofriceservice.domain.PricePerDay;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = PricePerDay.class)
@Controller
@RequestMapping("/priceperdays")
@RooWebScaffold(path = "priceperdays", formBackingObject = PricePerDay.class)
public class PricePerDayController {
}
