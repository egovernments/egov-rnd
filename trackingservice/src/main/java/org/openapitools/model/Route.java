package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import java.util.ArrayList;
import java.util.List;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * Route
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class Route {

  private String id;

  private String name;

  private String startPoi;

  private String endPoi;

  @Valid
  private List<String> intermediatePois;

  /**
   * Route status to help to exclude or include this in trip planning
   */
  public enum StatusEnum {
    ACTIVE("active"),
    
    INACTIVE("inactive");

    private String value;

    StatusEnum(String value) {
      this.value = value;
    }

    @JsonValue
    public String getValue() {
      return value;
    }

    @Override
    public String toString() {
      return String.valueOf(value);
    }

    @JsonCreator
    public static StatusEnum fromValue(String value) {
      for (StatusEnum b : StatusEnum.values()) {
        if (b.value.equals(value)) {
          return b;
        }
      }
      throw new IllegalArgumentException("Unexpected value '" + value + "'");
    }
  }

  private StatusEnum status;

  private String userId;

  public Route id(String id) {
    this.id = id;
    return this;
  }

  /**
   * GUID generated during Route creation
   * @return id
  */
  
  @Schema(name = "id", description = "GUID generated during Route creation", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("id")
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public Route name(String name) {
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

  public Route startPoi(String startPoi) {
    this.startPoi = startPoi;
    return this;
  }

  /**
   * POI id of the start location for a route
   * @return startPoi
  */
  
  @Schema(name = "startPoi", description = "POI id of the start location for a route", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("startPoi")
  public String getStartPoi() {
    return startPoi;
  }

  public void setStartPoi(String startPoi) {
    this.startPoi = startPoi;
  }

  public Route endPoi(String endPoi) {
    this.endPoi = endPoi;
    return this;
  }

  /**
   * POI id of the end location for a route
   * @return endPoi
  */
  
  @Schema(name = "endPoi", description = "POI id of the end location for a route", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("endPoi")
  public String getEndPoi() {
    return endPoi;
  }

  public void setEndPoi(String endPoi) {
    this.endPoi = endPoi;
  }

  public Route intermediatePois(List<String> intermediatePois) {
    this.intermediatePois = intermediatePois;
    return this;
  }

  public Route addIntermediatePoisItem(String intermediatePoisItem) {
    if (this.intermediatePois == null) {
      this.intermediatePois = new ArrayList<>();
    }
    this.intermediatePois.add(intermediatePoisItem);
    return this;
  }

  /**
   * Get intermediatePois
   * @return intermediatePois
  */
  
  @Schema(name = "intermediatePois", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("intermediatePois")
  public List<String> getIntermediatePois() {
    return intermediatePois;
  }

  public void setIntermediatePois(List<String> intermediatePois) {
    this.intermediatePois = intermediatePois;
  }

  public Route status(StatusEnum status) {
    this.status = status;
    return this;
  }

  /**
   * Route status to help to exclude or include this in trip planning
   * @return status
  */
  
  @Schema(name = "status", example = "active", description = "Route status to help to exclude or include this in trip planning", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("status")
  public StatusEnum getStatus() {
    return status;
  }

  public void setStatus(StatusEnum status) {
    this.status = status;
  }

  public Route userId(String userId) {
    this.userId = userId;
    return this;
  }

  /**
   * DIGIT Id of the user performing this action
   * @return userId
  */
  
  @Schema(name = "userId", example = "rajan123", description = "DIGIT Id of the user performing this action", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("userId")
  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Route route = (Route) o;
    return Objects.equals(this.id, route.id) &&
        Objects.equals(this.name, route.name) &&
        Objects.equals(this.startPoi, route.startPoi) &&
        Objects.equals(this.endPoi, route.endPoi) &&
        Objects.equals(this.intermediatePois, route.intermediatePois) &&
        Objects.equals(this.status, route.status) &&
        Objects.equals(this.userId, route.userId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, name, startPoi, endPoi, intermediatePois, status, userId);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Route {\n");
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    startPoi: ").append(toIndentedString(startPoi)).append("\n");
    sb.append("    endPoi: ").append(toIndentedString(endPoi)).append("\n");
    sb.append("    intermediatePois: ").append(toIndentedString(intermediatePois)).append("\n");
    sb.append("    status: ").append(toIndentedString(status)).append("\n");
    sb.append("    userId: ").append(toIndentedString(userId)).append("\n");
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

