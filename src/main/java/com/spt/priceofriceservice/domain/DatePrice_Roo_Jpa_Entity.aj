// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.priceofriceservice.domain;

import com.spt.priceofriceservice.domain.DatePrice;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect DatePrice_Roo_Jpa_Entity {
    
    declare @type: DatePrice: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long DatePrice.id;
    
    @Version
    @Column(name = "version")
    private Integer DatePrice.version;
    
    public Long DatePrice.getId() {
        return this.id;
    }
    
    public void DatePrice.setId(Long id) {
        this.id = id;
    }
    
    public Integer DatePrice.getVersion() {
        return this.version;
    }
    
    public void DatePrice.setVersion(Integer version) {
        this.version = version;
    }
    
}
