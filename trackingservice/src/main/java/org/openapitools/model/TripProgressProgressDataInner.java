package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonTypeName;
import org.openapitools.model.Location;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * TripProgressProgressDataInner
 */

@JsonTypeName("TripProgress_progressData_inner")
@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class TripProgressProgressDataInner {

  private String progressTime;

  private Location location;

  public TripProgressProgressDataInner progressTime(String progressTime) {
    this.progressTime = progressTime;
    return this;
  }

  /**
   * Date and time in ISO_DATE_TIME format. Actual time at which the operator was present at the location
   * @return progressTime
  */
  
  @Schema(name = "progressTime", example = "2023-07-30T10:24:10.547Z", description = "Date and time in ISO_DATE_TIME format. Actual time at which the operator was present at the location", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("progressTime")
  public String getProgressTime() {
    return progressTime;
  }

  public void setProgressTime(String progressTime) {
    this.progressTime = progressTime;
  }

  public TripProgressProgressDataInner location(Location location) {
    this.location = location;
    return this;
  }

  /**
   * Get location
   * @return location
  */
  @Valid 
  @Schema(name = "location", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("location")
  public Location getLocation() {
    return location;
  }

  public void setLocation(Location location) {
    this.location = location;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    TripProgressProgressDataInner tripProgressProgressDataInner = (TripProgressProgressDataInner) o;
    return Objects.equals(this.progressTime, tripProgressProgressDataInner.progressTime) &&
        Objects.equals(this.location, tripProgressProgressDataInner.location);
  }

  @Override
  public int hashCode() {
    return Objects.hash(progressTime, location);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class TripProgressProgressDataInner {\n");
    sb.append("    progressTime: ").append(toIndentedString(progressTime)).append("\n");
    sb.append("    location: ").append(toIndentedString(location)).append("\n");
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

