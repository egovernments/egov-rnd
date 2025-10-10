package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import org.openapitools.model.Location;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * Trip progress response is returned by the service
 */

@Schema(name = "TripProgressResponse", description = "Trip progress response is returned by the service")
@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class TripProgressResponse {

  private String id;

  private String tripId;

  private String progressReportedTime;

  private String progressTime;

  private Location location;

  public TripProgressResponse id(String id) {
    this.id = id;
    return this;
  }

  /**
   * Id of the trip progress
   * @return id
  */
  
  @Schema(name = "id", description = "Id of the trip progress", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("id")
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public TripProgressResponse tripId(String tripId) {
    this.tripId = tripId;
    return this;
  }

  /**
   * Id of the trip to which this progress update belongs to
   * @return tripId
  */
  
  @Schema(name = "tripId", description = "Id of the trip to which this progress update belongs to", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("tripId")
  public String getTripId() {
    return tripId;
  }

  public void setTripId(String tripId) {
    this.tripId = tripId;
  }

  public TripProgressResponse progressReportedTime(String progressReportedTime) {
    this.progressReportedTime = progressReportedTime;
    return this;
  }

  /**
   * Date and time in ISO_DATE_TIME format. Time at which the client app is reporting this data. This can be different from the time when the geo data was recorded as the app might be offline at that time but reporting it later once the app is online.
   * @return progressReportedTime
  */
  
  @Schema(name = "progressReportedTime", example = "2023-07-30T10:24:10.547Z", description = "Date and time in ISO_DATE_TIME format. Time at which the client app is reporting this data. This can be different from the time when the geo data was recorded as the app might be offline at that time but reporting it later once the app is online.", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("progressReportedTime")
  public String getProgressReportedTime() {
    return progressReportedTime;
  }

  public void setProgressReportedTime(String progressReportedTime) {
    this.progressReportedTime = progressReportedTime;
  }

  public TripProgressResponse progressTime(String progressTime) {
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

  public TripProgressResponse location(Location location) {
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
    TripProgressResponse tripProgressResponse = (TripProgressResponse) o;
    return Objects.equals(this.id, tripProgressResponse.id) &&
        Objects.equals(this.tripId, tripProgressResponse.tripId) &&
        Objects.equals(this.progressReportedTime, tripProgressResponse.progressReportedTime) &&
        Objects.equals(this.progressTime, tripProgressResponse.progressTime) &&
        Objects.equals(this.location, tripProgressResponse.location);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, tripId, progressReportedTime, progressTime, location);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class TripProgressResponse {\n");
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    tripId: ").append(toIndentedString(tripId)).append("\n");
    sb.append("    progressReportedTime: ").append(toIndentedString(progressReportedTime)).append("\n");
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

