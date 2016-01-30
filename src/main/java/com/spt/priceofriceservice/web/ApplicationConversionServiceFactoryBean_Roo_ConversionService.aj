// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spt.priceofriceservice.web;

import com.spt.priceofriceservice.domain.DatePrice;
import com.spt.priceofriceservice.domain.PricePerDay;
import com.spt.priceofriceservice.domain.SeedRice;
import com.spt.priceofriceservice.domain.TypeRice;
import com.spt.priceofriceservice.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<DatePrice, String> ApplicationConversionServiceFactoryBean.getDatePriceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.spt.priceofriceservice.domain.DatePrice, java.lang.String>() {
            public String convert(DatePrice datePrice) {
                return new StringBuilder().append(datePrice.getDateCode()).append(' ').append(datePrice.getDateOfPrice()).toString();
            }
        };
    }
    
    public Converter<Long, DatePrice> ApplicationConversionServiceFactoryBean.getIdToDatePriceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.spt.priceofriceservice.domain.DatePrice>() {
            public com.spt.priceofriceservice.domain.DatePrice convert(java.lang.Long id) {
                return DatePrice.findDatePrice(id);
            }
        };
    }
    
    public Converter<String, DatePrice> ApplicationConversionServiceFactoryBean.getStringToDatePriceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.spt.priceofriceservice.domain.DatePrice>() {
            public com.spt.priceofriceservice.domain.DatePrice convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), DatePrice.class);
            }
        };
    }
    
    public Converter<PricePerDay, String> ApplicationConversionServiceFactoryBean.getPricePerDayToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.spt.priceofriceservice.domain.PricePerDay, java.lang.String>() {
            public String convert(PricePerDay pricePerDay) {
                return new StringBuilder().append(pricePerDay.getPrice()).toString();
            }
        };
    }
    
    public Converter<Long, PricePerDay> ApplicationConversionServiceFactoryBean.getIdToPricePerDayConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.spt.priceofriceservice.domain.PricePerDay>() {
            public com.spt.priceofriceservice.domain.PricePerDay convert(java.lang.Long id) {
                return PricePerDay.findPricePerDay(id);
            }
        };
    }
    
    public Converter<String, PricePerDay> ApplicationConversionServiceFactoryBean.getStringToPricePerDayConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.spt.priceofriceservice.domain.PricePerDay>() {
            public com.spt.priceofriceservice.domain.PricePerDay convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PricePerDay.class);
            }
        };
    }
    
    public Converter<SeedRice, String> ApplicationConversionServiceFactoryBean.getSeedRiceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.spt.priceofriceservice.domain.SeedRice, java.lang.String>() {
            public String convert(SeedRice seedRice) {
                return new StringBuilder().append(seedRice.getSeedRiceCode()).append(' ').append(seedRice.getSeedRiceName()).toString();
            }
        };
    }
    
    public Converter<Long, SeedRice> ApplicationConversionServiceFactoryBean.getIdToSeedRiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.spt.priceofriceservice.domain.SeedRice>() {
            public com.spt.priceofriceservice.domain.SeedRice convert(java.lang.Long id) {
                return SeedRice.findSeedRice(id);
            }
        };
    }
    
    public Converter<String, SeedRice> ApplicationConversionServiceFactoryBean.getStringToSeedRiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.spt.priceofriceservice.domain.SeedRice>() {
            public com.spt.priceofriceservice.domain.SeedRice convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), SeedRice.class);
            }
        };
    }
    
    public Converter<TypeRice, String> ApplicationConversionServiceFactoryBean.getTypeRiceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.spt.priceofriceservice.domain.TypeRice, java.lang.String>() {
            public String convert(TypeRice typeRice) {
                return new StringBuilder().append(typeRice.getTypeRiceCode()).append(' ').append(typeRice.getTypeRiceName()).append(' ').append(typeRice.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, TypeRice> ApplicationConversionServiceFactoryBean.getIdToTypeRiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.spt.priceofriceservice.domain.TypeRice>() {
            public com.spt.priceofriceservice.domain.TypeRice convert(java.lang.Long id) {
                return TypeRice.findTypeRice(id);
            }
        };
    }
    
    public Converter<String, TypeRice> ApplicationConversionServiceFactoryBean.getStringToTypeRiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.spt.priceofriceservice.domain.TypeRice>() {
            public com.spt.priceofriceservice.domain.TypeRice convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), TypeRice.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getDatePriceToStringConverter());
        registry.addConverter(getIdToDatePriceConverter());
        registry.addConverter(getStringToDatePriceConverter());
        registry.addConverter(getPricePerDayToStringConverter());
        registry.addConverter(getIdToPricePerDayConverter());
        registry.addConverter(getStringToPricePerDayConverter());
        registry.addConverter(getSeedRiceToStringConverter());
        registry.addConverter(getIdToSeedRiceConverter());
        registry.addConverter(getStringToSeedRiceConverter());
        registry.addConverter(getTypeRiceToStringConverter());
        registry.addConverter(getIdToTypeRiceConverter());
        registry.addConverter(getStringToTypeRiceConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}