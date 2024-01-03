package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import org.openapitools.model.Citizen;
import org.openapitools.model.Operator;
import org.openapitools.model.Vehicle;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * Trip
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class Trip {

  private String id;

  private String tenantId;

  private String referenceNo;

  private String routeId;

  private String name;

  private String serviceCode;

  /**
   * Trip status as progress is made
   */
  public enum StatusEnum {
    NOTSTARTED("NotStarted"),
    
    ONGOING("Ongoing"),
    
    COMPLETED("Completed"),
    
    CANCELLED("Cancelled");

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

  private String tripEndType;

  private Operator operator;

  private Citizen citizen;

  private Vehicle vehicle;

  private String plannedStartTime;

  private String plannedEndTime;

  private String actualStartTime;

  private String actualEndTime;

  private String pickupLocation;

  private String dropLocation;

  private String userId;

  public Trip id(String id) {
    this.id = id;
    return this;
  }

  /**
   * Id of the trip
   * @return id
  */
  
  @Schema(name = "id", description = "Id of the trip", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("id")
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public Trip tenantId(String tenantId) {
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

  public Trip referenceNo(String referenceNo) {
    this.referenceNo = referenceNo;
    return this;
  }

  /**
   * Application number to which this trip belongs to
   * @return referenceNo
  */
  
  @Schema(name = "referenceNo", description = "Application number to which this trip belongs to", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("referenceNo")
  public String getReferenceNo() {
    return referenceNo;
  }

  public void setReferenceNo(String referenceNo) {
    this.referenceNo = referenceNo;
  }

  public Trip routeId(String routeId) {
    this.routeId = routeId;
    return this;
  }

  /**
   * Id of the assigned route
   * @return routeId
  */
  
  @Schema(name = "routeId", description = "Id of the assigned route", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("routeId")
  public String getRouteId() {
    return routeId;
  }

  public void setRouteId(String routeId) {
    this.routeId = routeId;
  }

  public Trip name(String name) {
    this.name = name;
    return this;
  }

  /**
   * User defined name for the trip
   * @return name
  */
  
  @Schema(name = "name", description = "User defined name for the trip", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("name")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Trip serviceCode(String serviceCode) {
    this.serviceCode = serviceCode;
    return this;
  }

  /**
   * Code of the service which will be rendered through this trip
   * @return serviceCode
  */
  
  @Schema(name = "serviceCode", description = "Code of the service which will be rendered through this trip", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("serviceCode")
  public String getServiceCode() {
    return serviceCode;
  }

  public void setServiceCode(String serviceCode) {
    this.serviceCode = serviceCode;
  }

  public Trip status(StatusEnum status) {
    this.status = status;
    return this;
  }

  /**
   * Trip status as progress is made
   * @return status
  */
  
  @Schema(name = "status", example = "created", description = "Trip status as progress is made", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("status")
  public StatusEnum getStatus() {
    return status;
  }

  public void setStatus(StatusEnum status) {
    this.status = status;
  }

  public Trip tripEndType(String tripEndType) {
    this.tripEndType = tripEndType;
    return this;
  }

  /**
   * End type code for the trip (system, FSTPO, driver etc )
   * @return tripEndType
  */
  
  @Schema(name = "tripEndType", description = "End type code for the trip (system, FSTPO, driver etc )", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("tripEndType")
  public String getTripEndType() {
    return tripEndType;
  }

  public void setTripEndType(String tripEndType) {
    this.tripEndType = tripEndType;
  }

  public Trip operator(Operator operator) {
    this.operator = operator;
    return this;
  }

  /**
   * Get operator
   * @return operator
  */
  @Valid 
  @Schema(name = "operator", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("operator")
  public Operator getOperator() {
    return operator;
  }

  public void setOperator(Operator operator) {
    this.operator = operator;
  }

  public Trip citizen(Citizen citizen) {
    this.citizen = citizen;
    return this;
  }

  /**
   * Get citizen
   * @return citizen
  */
  @Valid 
  @Schema(name = "citizen", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("citizen")
  public Citizen getCitizen() {
    return citizen;
  }

  public void setCitizen(Citizen citizen) {
    this.citizen = citizen;
  }

  public Trip vehicle(Vehicle vehicle) {
    this.vehicle = vehicle;
    return this;
  }

  /**
   * Get vehicle
   * @return vehicle
  */
  @Valid 
  @Schema(name = "vehicle", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("vehicle")
  public Vehicle getVehicle() {
    return vehicle;
  }

  public void setVehicle(Vehicle vehicle) {
    this.vehicle = vehicle;
  }

  public Trip plannedStartTime(String plannedStartTime) {
    this.plannedStartTime = plannedStartTime;
    return this;
  }

  /**
   * Date and time in ISO_DATE_TIME format
   * @return plannedStartTime
  */
  
  @Schema(name = "plannedStartTime", example = "2023-07-30T10:24:10.547Z", description = "Date and time in ISO_DATE_TIME format", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("plannedStartTime")
  public String getPlannedStartTime() {
    return plannedStartTime;
  }

  public void setPlannedStartTime(String plannedStartTime) {
    this.plannedStartTime = plannedStartTime;
  }

  public Trip plannedEndTime(String plannedEndTime) {
    this.plannedEndTime = plannedEndTime;
    return this;
  }

  /**
   * Date and time in ISO_DATE_TIME format
   * @return plannedEndTime
  */
  
  @Schema(name = "plannedEndTime", example = "2023-07-30T10:24:10.547Z", description = "Date and time in ISO_DATE_TIME format", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("plannedEndTime")
  public String getPlannedEndTime() {
    return plannedEndTime;
  }

  public void setPlannedEndTime(String plannedEndTime) {
    this.plannedEndTime = plannedEndTime;
  }

  public Trip actualStartTime(String actualStartTime) {
    this.actualStartTime = actualStartTime;
    return this;
  }

  /**
   * Date and time in ISO_DATE_TIME format
   * @return actualStartTime
  */
  
  @Schema(name = "actualStartTime", example = "2023-07-30T10:24:10.547Z", description = "Date and time in ISO_DATE_TIME format", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("actualStartTime")
  public String getActualStartTime() {
    return actualStartTime;
  }

  public void setActualStartTime(String actualStartTime) {
    this.actualStartTime = actualStartTime;
  }

  public Trip actualEndTime(String actualEndTime) {
    this.actualEndTime = actualEndTime;
    return this;
  }

  /**
   * Date and time in ISO_DATE_TIME format
   * @return actualEndTime
  */
  
  @Schema(name = "actualEndTime", example = "2023-07-30T10:24:10.547Z", description = "Date and time in ISO_DATE_TIME format", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("actualEndTime")
  public String getActualEndTime() {
    return actualEndTime;
  }

  public void setActualEndTime(String actualEndTime) {
    this.actualEndTime = actualEndTime;
  }

  public Trip pickupLocation(String pickupLocation) {
    this.pickupLocation = pickupLocation;
    return this;
  }

  /**
   * Get pickupLocation
   * @return pickupLocation
  */
  
  @Schema(name = "pickupLocation", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("pickupLocation")
  public String getPickupLocation() {
    return pickupLocation;
  }

  public void setPickupLocation(String pickupLocation) {
    this.pickupLocation = pickupLocation;
  }

  public Trip dropLocation(String dropLocation) {
    this.dropLocation = dropLocation;
    return this;
  }

  /**
   * Get dropLocation
   * @return dropLocation
  */
  
  @Schema(name = "dropLocation", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("dropLocation")
  public String getDropLocation() {
    return dropLocation;
  }

  public void setDropLocation(String dropLocation) {
    this.dropLocation = dropLocation;
  }

  public Trip userId(String userId) {
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
    Trip trip = (Trip) o;
    return Objects.equals(this.id, trip.id) &&
        Objects.equals(this.tenantId, trip.tenantId) &&
        Objects.equals(this.referenceNo, trip.referenceNo) &&
        Objects.equals(this.routeId, trip.routeId) &&
        Objects.equals(this.name, trip.name) &&
        Objects.equals(this.serviceCode, trip.serviceCode) &&
        Objects.equals(this.status, trip.status) &&
        Objects.equals(this.tripEndType, trip.tripEndType) &&
        Objects.equals(this.operator, trip.operator) &&
        Objects.equals(this.citizen, trip.citizen) &&
        Objects.equals(this.vehicle, trip.vehicle) &&
        Objects.equals(this.plannedStartTime, trip.plannedStartTime) &&
        Objects.equals(this.plannedEndTime, trip.plannedEndTime) &&
        Objects.equals(this.actualStartTime, trip.actualStartTime) &&
        Objects.equals(this.actualEndTime, trip.actualEndTime) &&
        Objects.equals(this.pickupLocation, trip.pickupLocation) &&
        Objects.equals(this.dropLocation, trip.dropLocation) &&
        Objects.equals(this.userId, trip.userId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, tenantId, referenceNo, routeId, name, serviceCode, status, tripEndType, operator, citizen, vehicle, plannedStartTime, plannedEndTime, actualStartTime, actualEndTime, pickupLocation, dropLocation, userId);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Trip {\n");
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    tenantId: ").append(toIndentedString(tenantId)).append("\n");
    sb.append("    referenceNo: ").append(toIndentedString(referenceNo)).append("\n");
    sb.append("    routeId: ").append(toIndentedString(routeId)).append("\n");
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    serviceCode: ").append(toIndentedString(serviceCode)).append("\n");
    sb.append("    status: ").append(toIndentedString(status)).append("\n");
    sb.append("    tripEndType: ").append(toIndentedString(tripEndType)).append("\n");
    sb.append("    operator: ").append(toIndentedString(operator)).append("\n");
    sb.append("    citizen: ").append(toIndentedString(citizen)).append("\n");
    sb.append("    vehicle: ").append(toIndentedString(vehicle)).append("\n");
    sb.append("    plannedStartTime: ").append(toIndentedString(plannedStartTime)).append("\n");
    sb.append("    plannedEndTime: ").append(toIndentedString(plannedEndTime)).append("\n");
    sb.append("    actualStartTime: ").append(toIndentedString(actualStartTime)).append("\n");
    sb.append("    actualEndTime: ").append(toIndentedString(actualEndTime)).append("\n");
    sb.append("    pickupLocation: ").append(toIndentedString(pickupLocation)).append("\n");
    sb.append("    dropLocation: ").append(toIndentedString(dropLocation)).append("\n");
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

