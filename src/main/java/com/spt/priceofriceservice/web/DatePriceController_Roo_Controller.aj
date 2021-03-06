// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.priceofriceservice.web;

import com.spt.priceofriceservice.domain.DatePrice;
import com.spt.priceofriceservice.domain.PricePerDay;
import com.spt.priceofriceservice.web.DatePriceController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DatePriceController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DatePriceController.create(@Valid DatePrice datePrice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, datePrice);
            return "dateprices/create";
        }
        uiModel.asMap().clear();
        datePrice.persist();
        return "redirect:/dateprices/" + encodeUrlPathSegment(datePrice.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DatePriceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new DatePrice());
        return "dateprices/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DatePriceController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("dateprice", DatePrice.findDatePrice(id));
        uiModel.addAttribute("itemId", id);
        return "dateprices/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DatePriceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("dateprices", DatePrice.findDatePriceEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) DatePrice.countDatePrices() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("dateprices", DatePrice.findAllDatePrices(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "dateprices/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DatePriceController.update(@Valid DatePrice datePrice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, datePrice);
            return "dateprices/update";
        }
        uiModel.asMap().clear();
        datePrice.merge();
        return "redirect:/dateprices/" + encodeUrlPathSegment(datePrice.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DatePriceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, DatePrice.findDatePrice(id));
        return "dateprices/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DatePriceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DatePrice datePrice = DatePrice.findDatePrice(id);
        datePrice.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/dateprices";
    }
    
    void DatePriceController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("datePrice_dateofprice_date_format", "dd/MM/yyyy");
    }
    
    void DatePriceController.populateEditForm(Model uiModel, DatePrice datePrice) {
        uiModel.addAttribute("datePrice", datePrice);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("priceperdays", PricePerDay.findAllPricePerDays());
    }
    
    String DatePriceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
