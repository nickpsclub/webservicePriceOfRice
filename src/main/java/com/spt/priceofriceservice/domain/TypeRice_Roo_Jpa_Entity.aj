// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.priceofriceservice.domain;

import com.spt.priceofriceservice.domain.TypeRice;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect TypeRice_Roo_Jpa_Entity {
    
    declare @type: TypeRice: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long TypeRice.id;
    
    @Version
    @Column(name = "version")
    private Integer TypeRice.version;
    
    public Long TypeRice.getId() {
        return this.id;
    }
    
    public void TypeRice.setId(Long id) {
        this.id = id;
    }
    
    public Integer TypeRice.getVersion() {
        return this.version;
    }
    
    public void TypeRice.setVersion(Integer version) {
        this.version = version;
    }
    
}
