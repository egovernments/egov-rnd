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
 * ACK
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class ACK {

  private String id;

  private String responseMessage;

  private String responseCode;

  public ACK id(String id) {
    this.id = id;
    return this;
  }

  /**
   * Id of the entity that is created or updated
   * @return id
  */
  
  @Schema(name = "id", example = "116bd8d3-e5a9-4e1c-86dc-b2a9c17e3fb1", description = "Id of the entity that is created or updated", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("id")
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public ACK responseMessage(String responseMessage) {
    this.responseMessage = responseMessage;
    return this;
  }

  /**
   * Date and time in ISO_DATE_TIME format
   * @return responseMessage
  */
  
  @Schema(name = "responseMessage", example = "Update is succesful", description = "Date and time in ISO_DATE_TIME format", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("responseMessage")
  public String getResponseMessage() {
    return responseMessage;
  }

  public void setResponseMessage(String responseMessage) {
    this.responseMessage = responseMessage;
  }

  public ACK responseCode(String responseCode) {
    this.responseCode = responseCode;
    return this;
  }

  /**
   * Get responseCode
   * @return responseCode
  */
  
  @Schema(name = "responseCode", example = "CODE-123", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("responseCode")
  public String getResponseCode() {
    return responseCode;
  }

  public void setResponseCode(String responseCode) {
    this.responseCode = responseCode;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ACK ACK = (ACK) o;
    return Objects.equals(this.id, ACK.id) &&
        Objects.equals(this.responseMessage, ACK.responseMessage) &&
        Objects.equals(this.responseCode, ACK.responseCode);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, responseMessage, responseCode);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ACK {\n");
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    responseMessage: ").append(toIndentedString(responseMessage)).append("\n");
    sb.append("    responseCode: ").append(toIndentedString(responseCode)).append("\n");
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

