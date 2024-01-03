package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import org.openapitools.model.RequestInfo;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * RequestInfoWrapper
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class RequestInfoWrapper {

  private RequestInfo requestInfo;

  public RequestInfoWrapper requestInfo(RequestInfo requestInfo) {
    this.requestInfo = requestInfo;
    return this;
  }

  /**
   * Get requestInfo
   * @return requestInfo
  */
  @Valid 
  @Schema(name = "RequestInfo", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("RequestInfo")
  public RequestInfo getRequestInfo() {
    return requestInfo;
  }

  public void setRequestInfo(RequestInfo requestInfo) {
    this.requestInfo = requestInfo;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    RequestInfoWrapper requestInfoWrapper = (RequestInfoWrapper) o;
    return Objects.equals(this.requestInfo, requestInfoWrapper.requestInfo);
  }

  @Override
  public int hashCode() {
    return Objects.hash(requestInfo);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class RequestInfoWrapper {\n");
    sb.append("    requestInfo: ").append(toIndentedString(requestInfo)).append("\n");
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

