// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.priceofriceservice.web;

import com.spt.priceofriceservice.domain.PricePerDay;
import com.spt.priceofriceservice.domain.SeedRice;
import com.spt.priceofriceservice.domain.TypeRice;
import com.spt.priceofriceservice.web.TypeRiceController;
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

privileged aspect TypeRiceController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TypeRiceController.create(@Valid TypeRice typeRice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, typeRice);
            return "typerices/create";
        }
        uiModel.asMap().clear();
        typeRice.persist();
        return "redirect:/typerices/" + encodeUrlPathSegment(typeRice.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TypeRiceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TypeRice());
        return "typerices/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TypeRiceController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("typerice", TypeRice.findTypeRice(id));
        uiModel.addAttribute("itemId", id);
        return "typerices/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TypeRiceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("typerices", TypeRice.findTypeRiceEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) TypeRice.countTypeRices() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("typerices", TypeRice.findAllTypeRices(sortFieldName, sortOrder));
        }
        return "typerices/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TypeRiceController.update(@Valid TypeRice typeRice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, typeRice);
            return "typerices/update";
        }
        uiModel.asMap().clear();
        typeRice.merge();
        return "redirect:/typerices/" + encodeUrlPathSegment(typeRice.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TypeRiceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, TypeRice.findTypeRice(id));
        return "typerices/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TypeRiceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TypeRice typeRice = TypeRice.findTypeRice(id);
        typeRice.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/typerices";
    }
    
    void TypeRiceController.populateEditForm(Model uiModel, TypeRice typeRice) {
        uiModel.addAttribute("typeRice", typeRice);
        uiModel.addAttribute("priceperdays", PricePerDay.findAllPricePerDays());
        uiModel.addAttribute("seedrices", SeedRice.findAllSeedRices());
    }
    
    String TypeRiceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
