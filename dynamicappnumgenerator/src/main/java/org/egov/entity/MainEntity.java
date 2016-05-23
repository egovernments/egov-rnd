package org.egov.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class MainEntity {

    @Id
    @GeneratedValue
    private Long id;

    private String code;

    @ManyToOne
    private RelationalEntity relationalEntity;

    public RelationalEntity getRelationalEntity() {
        return relationalEntity;
    }

    public void setRelationalEntity(final RelationalEntity relationalEntity) {
        this.relationalEntity = relationalEntity;
    }

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(final String code) {
        this.code = code;
    }

}
