package org.egov.web.controller;

import org.egov.entity.AppNumberFormat;
import org.egov.entity.MainEntity;
import org.egov.entity.NonRelationalEntity;
import org.egov.service.AppNumberFormatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@RestController
public class DynamicApplicationNumberGeneratorController {

    @Autowired
    private AppNumberFormatService appNumberFormatService;

    @PersistenceContext
    private EntityManager entityManager;

    @RequestMapping("/")
    public String index() {
        MainEntity mainEntity = entityManager.find(MainEntity.class, 1l);
        NonRelationalEntity nonRelationalEntity = entityManager.find(NonRelationalEntity.class, 1l);
        AppNumberFormat appNumberFormat = entityManager.find(AppNumberFormat.class, 1l);
        return "Before Format : "+appNumberFormat.getFormat()+"<br/>After Format : "+
                appNumberFormatService.generateApplicationNumber("DYNAMIC_NUM", mainEntity, nonRelationalEntity);
    }
}
