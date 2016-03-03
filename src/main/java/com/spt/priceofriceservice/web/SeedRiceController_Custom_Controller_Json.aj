// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.priceofriceservice.web;

import com.spt.priceofriceservice.domain.SeedRice;
import com.spt.priceofriceservice.web.SeedRiceController;
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



privileged aspect SeedRiceController_Custom_Controller_Json {

    @RequestMapping(value = "/findAllSeedRice", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String>SeedRiceController.findAllSeedRices() {

        List<SeedRice> result = SeedRice.findAllSeedRices();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (result == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>((new JSONSerializer()
            .include("id")
            .include("seedRiceCode")
            .include("seedRiceName")
            .include("version")
            .exclude("*")
            .deepSerialize(result)),headers, HttpStatus.OK);
    }


    @RequestMapping(value = "/findSeedRiceById", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String>SeedRiceController.findSeedRiceById(@RequestParam(value="id", required = false)Long id) {

        SeedRice result = SeedRice.findSeedRice(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (result == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>((new JSONSerializer()
            .include("id")
            .include("seedRiceCode")
            .include("seedRiceName")
            .include("version")
            .exclude("*")
            .deepSerialize(result)),headers, HttpStatus.OK);
    }
    
    
    
}
