package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import java.util.ArrayList;
import java.util.List;
import org.openapitools.model.TripProgressProgressDataInner;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * Trip progress is shared by the client continuously as the operator is moving
 */

@Schema(name = "TripProgress", description = "Trip progress is shared by the client continuously as the operator is moving")
@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class TripProgress {

  private String id;

  private String tripId;

  private String progressReportedTime;

  @Valid
  private List<@Valid TripProgressProgressDataInner> progressData;

  private String matchedPoiId;

  private String userId;

  public TripProgress id(String id) {
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

  public TripProgress tripId(String tripId) {
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

  public TripProgress progressReportedTime(String progressReportedTime) {
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

  public TripProgress progressData(List<@Valid TripProgressProgressDataInner> progressData) {
    this.progressData = progressData;
    return this;
  }

  public TripProgress addProgressDataItem(TripProgressProgressDataInner progressDataItem) {
    if (this.progressData == null) {
      this.progressData = new ArrayList<>();
    }
    this.progressData.add(progressDataItem);
    return this;
  }

  /**
   * Get progressData
   * @return progressData
  */
  @Valid 
  @Schema(name = "progressData", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("progressData")
  public List<@Valid TripProgressProgressDataInner> getProgressData() {
    return progressData;
  }

  public void setProgressData(List<@Valid TripProgressProgressDataInner> progressData) {
    this.progressData = progressData;
  }

  public TripProgress matchedPoiId(String matchedPoiId) {
    this.matchedPoiId = matchedPoiId;
    return this;
  }

  /**
   * Id of the POI which matched this location. This is not set by client but is updated by an internal trip monitoring service
   * @return matchedPoiId
  */
  
  @Schema(name = "matchedPoiId", description = "Id of the POI which matched this location. This is not set by client but is updated by an internal trip monitoring service", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("matchedPoiId")
  public String getMatchedPoiId() {
    return matchedPoiId;
  }

  public void setMatchedPoiId(String matchedPoiId) {
    this.matchedPoiId = matchedPoiId;
  }

  public TripProgress userId(String userId) {
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
    TripProgress tripProgress = (TripProgress) o;
    return Objects.equals(this.id, tripProgress.id) &&
        Objects.equals(this.tripId, tripProgress.tripId) &&
        Objects.equals(this.progressReportedTime, tripProgress.progressReportedTime) &&
        Objects.equals(this.progressData, tripProgress.progressData) &&
        Objects.equals(this.matchedPoiId, tripProgress.matchedPoiId) &&
        Objects.equals(this.userId, tripProgress.userId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, tripId, progressReportedTime, progressData, matchedPoiId, userId);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class TripProgress {\n");
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    tripId: ").append(toIndentedString(tripId)).append("\n");
    sb.append("    progressReportedTime: ").append(toIndentedString(progressReportedTime)).append("\n");
    sb.append("    progressData: ").append(toIndentedString(progressData)).append("\n");
    sb.append("    matchedPoiId: ").append(toIndentedString(matchedPoiId)).append("\n");
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

