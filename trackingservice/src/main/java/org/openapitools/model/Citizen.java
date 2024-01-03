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
 * Citizen
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class Citizen {

  private String name;

  private String contactNumber;

  public Citizen name(String name) {
    this.name = name;
    return this;
  }

  /**
   * Get name
   * @return name
  */
  
  @Schema(name = "name", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("name")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Citizen contactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
    return this;
  }

  /**
   * Get contactNumber
   * @return contactNumber
  */
  
  @Schema(name = "contactNumber", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("contactNumber")
  public String getContactNumber() {
    return contactNumber;
  }

  public void setContactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Citizen citizen = (Citizen) o;
    return Objects.equals(this.name, citizen.name) &&
        Objects.equals(this.contactNumber, citizen.contactNumber);
  }

  @Override
  public int hashCode() {
    return Objects.hash(name, contactNumber);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Citizen {\n");
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    contactNumber: ").append(toIndentedString(contactNumber)).append("\n");
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

