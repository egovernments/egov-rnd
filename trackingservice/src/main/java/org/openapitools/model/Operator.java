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
 * Operator
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class Operator {

  private String id;

  private String name;

  private String email;

  private String contactNumber;

  private String vehicleNumber;

  public Operator id(String id) {
    this.id = id;
    return this;
  }

  /**
   * User id of the operator of the service (for example, a vehicle driver)
   * @return id
  */
  
  @Schema(name = "id", description = "User id of the operator of the service (for example, a vehicle driver)", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("id")
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public Operator name(String name) {
    this.name = name;
    return this;
  }

  /**
   * Name of the operator
   * @return name
  */
  
  @Schema(name = "name", description = "Name of the operator", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("name")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Operator email(String email) {
    this.email = email;
    return this;
  }

  /**
   * Email id of the operator
   * @return email
  */
  
  @Schema(name = "email", description = "Email id of the operator", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("email")
  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public Operator contactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
    return this;
  }

  /**
   * Phone number of the operator
   * @return contactNumber
  */
  
  @Schema(name = "contactNumber", description = "Phone number of the operator", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("contactNumber")
  public String getContactNumber() {
    return contactNumber;
  }

  public void setContactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
  }

  public Operator vehicleNumber(String vehicleNumber) {
    this.vehicleNumber = vehicleNumber;
    return this;
  }

  /**
   * Vehicle number of the operator
   * @return vehicleNumber
  */
  
  @Schema(name = "vehicleNumber", description = "Vehicle number of the operator", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("vehicleNumber")
  public String getVehicleNumber() {
    return vehicleNumber;
  }

  public void setVehicleNumber(String vehicleNumber) {
    this.vehicleNumber = vehicleNumber;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Operator operator = (Operator) o;
    return Objects.equals(this.id, operator.id) &&
        Objects.equals(this.name, operator.name) &&
        Objects.equals(this.email, operator.email) &&
        Objects.equals(this.contactNumber, operator.contactNumber) &&
        Objects.equals(this.vehicleNumber, operator.vehicleNumber);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, name, email, contactNumber, vehicleNumber);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Operator {\n");
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    email: ").append(toIndentedString(email)).append("\n");
    sb.append("    contactNumber: ").append(toIndentedString(contactNumber)).append("\n");
    sb.append("    vehicleNumber: ").append(toIndentedString(vehicleNumber)).append("\n");
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

