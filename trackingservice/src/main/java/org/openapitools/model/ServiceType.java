package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * Citizen service provided by the government agency
 */

@Schema(name = "ServiceType", description = "Citizen service provided by the government agency")
@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class ServiceType {

  private String code;

  private String name;

  private String tenantId;

  public ServiceType code(String code) {
    this.code = code;
    return this;
  }

  /**
   * Unique code given to each service
   * @return code
  */
  
  @Schema(name = "code", description = "Unique code given to each service", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("code")
  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public ServiceType name(String name) {
    this.name = name;
    return this;
  }

  /**
   * Name of the service. For example - Mosquito fumigation, Fecal sludge pickup
   * @return name
  */
  
  @Schema(name = "name", description = "Name of the service. For example - Mosquito fumigation, Fecal sludge pickup", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("name")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public ServiceType tenantId(String tenantId) {
    this.tenantId = tenantId;
    return this;
  }

  /**
   * Identifier of the ULB where this service is offered
   * @return tenantId
  */
  
  @Schema(name = "tenantId", description = "Identifier of the ULB where this service is offered", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("tenantId")
  public String getTenantId() {
    return tenantId;
  }

  public void setTenantId(String tenantId) {
    this.tenantId = tenantId;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ServiceType serviceType = (ServiceType) o;
    return Objects.equals(this.code, serviceType.code) &&
        Objects.equals(this.name, serviceType.name) &&
        Objects.equals(this.tenantId, serviceType.tenantId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(code, name, tenantId);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ServiceType {\n");
    sb.append("    code: ").append(toIndentedString(code)).append("\n");
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    tenantId: ").append(toIndentedString(tenantId)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }
}

