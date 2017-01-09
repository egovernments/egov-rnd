package org.egov.repository;

import org.egov.entity.AppNumberFormat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppNumberFormatRepository extends JpaRepository<AppNumberFormat, Long> {

    AppNumberFormat findByName(String name);
}
