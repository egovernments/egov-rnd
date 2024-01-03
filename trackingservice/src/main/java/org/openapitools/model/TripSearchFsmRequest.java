package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonTypeName;
import org.openapitools.model.RequestInfoWrapper;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * TripSearchFsmRequest
 */

@JsonTypeName("tripSearchFsm_request")
@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class TripSearchFsmRequest {

  private RequestInfoWrapper requestInfoWrapper;

  public TripSearchFsmRequest requestInfoWrapper(RequestInfoWrapper requestInfoWrapper) {
    this.requestInfoWrapper = requestInfoWrapper;
    return this;
  }

  /**
   * Get requestInfoWrapper
   * @return requestInfoWrapper
  */
  @Valid 
  @Schema(name = "requestInfoWrapper", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("requestInfoWrapper")
  public RequestInfoWrapper getRequestInfoWrapper() {
    return requestInfoWrapper;
  }

  public void setRequestInfoWrapper(RequestInfoWrapper requestInfoWrapper) {
    this.requestInfoWrapper = requestInfoWrapper;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    TripSearchFsmRequest tripSearchFsmRequest = (TripSearchFsmRequest) o;
    return Objects.equals(this.requestInfoWrapper, tripSearchFsmRequest.requestInfoWrapper);
  }

  @Override
  public int hashCode() {
    return Objects.hash(requestInfoWrapper);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class TripSearchFsmRequest {\n");
    sb.append("    requestInfoWrapper: ").append(toIndentedString(requestInfoWrapper)).append("\n");
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

