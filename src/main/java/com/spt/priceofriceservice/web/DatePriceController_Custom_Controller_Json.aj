// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.priceofriceservice.web;

import com.spt.priceofriceservice.domain.DatePrice;
import com.spt.priceofriceservice.web.DatePriceController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponentsBuilder;
import flexjson.JSONSerializer;
import java.util.Date;


privileged aspect DatePriceController_Custom_Controller_Json {

    @RequestMapping(value = "/findDateByDay", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String>DatePriceController.findDateByDay(@RequestParam(value="day", required = false)String day) {

        List<DatePrice> result = DatePrice.findDateByDay(day);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (result == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>((new JSONSerializer()
            .include("id")
            .include("dateCode")
            .include("dateOfPrice")
            .exclude("*")
            .deepSerialize(result)),headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/saveData", method = RequestMethod.GET, headers = "Accept=application/json") 
    @ResponseBody
    public ResponseEntity<String> DatePriceController.saveData( @RequestParam("dateCode") String dateCode, 
                                                        @RequestParam("dateOfPrice") Long dateOfPrice){
        HttpHeaders headers = new HttpHeaders(); 
        headers.add("Content-Type", "application/json; charset=utf-8");

        Date date = new Date(dateOfPrice);

        DatePrice saveDatePrice = new DatePrice();

        saveDatePrice.setVersion(0);
        saveDatePrice.setDateCode(dateCode);
        saveDatePrice.setDateOfPrice(date);
        saveDatePrice.persist();

        return new ResponseEntity<String>((new JSONSerializer() 
            .include("id") 
            .exclude("*") 
            .deepSerialize(saveDatePrice)),headers, HttpStatus.OK); 
    }

    @RequestMapping(value = "/findAllDatePrices", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String>DatePriceController.findAllDatePrices() {

        List<DatePrice> result = DatePrice.findAllDatePrices();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (result == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>((new JSONSerializer()
            .include("id")
            .include("dateCode")
            .include("dateOfPrice")
            .exclude("*")
            .deepSerialize(result)),headers, HttpStatus.OK);
    }
}
