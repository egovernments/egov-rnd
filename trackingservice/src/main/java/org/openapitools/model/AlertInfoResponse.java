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
 * AlertInfoResponse
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class AlertInfoResponse {

  private String tenantId;

  private String applicationNo;

  private String tripId;

  private String alertId;

  private String alert;

  private String alertDateTime;

  private Location location;

  public AlertInfoResponse tenantId(String tenantId) {
    this.tenantId = tenantId;
    return this;
  }

  /**
   * Get tenantId
   * @return tenantId
  */
  
  @Schema(name = "tenantId", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("tenantId")
  public String getTenantId() {
    return tenantId;
  }

  public void setTenantId(String tenantId) {
    this.tenantId = tenantId;
  }

  public AlertInfoResponse applicationNo(String applicationNo) {
    this.applicationNo = applicationNo;
    return this;
  }

  /**
   * Get applicationNo
   * @return applicationNo
  */
  
  @Schema(name = "applicationNo", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("applicationNo")
  public String getApplicationNo() {
    return applicationNo;
  }

  public void setApplicationNo(String applicationNo) {
    this.applicationNo = applicationNo;
  }

  public AlertInfoResponse tripId(String tripId) {
    this.tripId = tripId;
    return this;
  }

  /**
   * Get tripId
   * @return tripId
  */
  
  @Schema(name = "tripId", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("tripId")
  public String getTripId() {
    return tripId;
  }

  public void setTripId(String tripId) {
    this.tripId = tripId;
  }

  public AlertInfoResponse alertId(String alertId) {
    this.alertId = alertId;
    return this;
  }

  /**
   * Get alertId
   * @return alertId
  */
  
  @Schema(name = "alertId", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("alertId")
  public String getAlertId() {
    return alertId;
  }

  public void setAlertId(String alertId) {
    this.alertId = alertId;
  }

  public AlertInfoResponse alert(String alert) {
    this.alert = alert;
    return this;
  }

  /**
   * Get alert
   * @return alert
  */
  
  @Schema(name = "alert", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("alert")
  public String getAlert() {
    return alert;
  }

  public void setAlert(String alert) {
    this.alert = alert;
  }

  public AlertInfoResponse alertDateTime(String alertDateTime) {
    this.alertDateTime = alertDateTime;
    return this;
  }

  /**
   * Get alertDateTime
   * @return alertDateTime
  */
  
  @Schema(name = "alertDateTime", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("alertDateTime")
  public String getAlertDateTime() {
    return alertDateTime;
  }

  public void setAlertDateTime(String alertDateTime) {
    this.alertDateTime = alertDateTime;
  }

  public AlertInfoResponse location(Location location) {
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
    AlertInfoResponse alertInfoResponse = (AlertInfoResponse) o;
    return Objects.equals(this.tenantId, alertInfoResponse.tenantId) &&
        Objects.equals(this.applicationNo, alertInfoResponse.applicationNo) &&
        Objects.equals(this.tripId, alertInfoResponse.tripId) &&
        Objects.equals(this.alertId, alertInfoResponse.alertId) &&
        Objects.equals(this.alert, alertInfoResponse.alert) &&
        Objects.equals(this.alertDateTime, alertInfoResponse.alertDateTime) &&
        Objects.equals(this.location, alertInfoResponse.location);
  }

  @Override
  public int hashCode() {
    return Objects.hash(tenantId, applicationNo, tripId, alertId, alert, alertDateTime, location);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class AlertInfoResponse {\n");
    sb.append("    tenantId: ").append(toIndentedString(tenantId)).append("\n");
    sb.append("    applicationNo: ").append(toIndentedString(applicationNo)).append("\n");
    sb.append("    tripId: ").append(toIndentedString(tripId)).append("\n");
    sb.append("    alertId: ").append(toIndentedString(alertId)).append("\n");
    sb.append("    alert: ").append(toIndentedString(alert)).append("\n");
    sb.append("    alertDateTime: ").append(toIndentedString(alertDateTime)).append("\n");
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

