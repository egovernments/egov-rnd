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
 * Address
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class Address {

  private String addressTitle;

  private String doorNo;

  private String plotNo;

  private String landmark;

  private String city;

  private String district;

  private String state;

  private String country;

  private String pincode;

  public Address addressTitle(String addressTitle) {
    this.addressTitle = addressTitle;
    return this;
  }

  /**
   * Get addressTitle
   * @return addressTitle
  */
  
  @Schema(name = "addressTitle", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("addressTitle")
  public String getAddressTitle() {
    return addressTitle;
  }

  public void setAddressTitle(String addressTitle) {
    this.addressTitle = addressTitle;
  }

  public Address doorNo(String doorNo) {
    this.doorNo = doorNo;
    return this;
  }

  /**
   * Get doorNo
   * @return doorNo
  */
  
  @Schema(name = "doorNo", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("doorNo")
  public String getDoorNo() {
    return doorNo;
  }

  public void setDoorNo(String doorNo) {
    this.doorNo = doorNo;
  }

  public Address plotNo(String plotNo) {
    this.plotNo = plotNo;
    return this;
  }

  /**
   * Get plotNo
   * @return plotNo
  */
  
  @Schema(name = "plotNo", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("plotNo")
  public String getPlotNo() {
    return plotNo;
  }

  public void setPlotNo(String plotNo) {
    this.plotNo = plotNo;
  }

  public Address landmark(String landmark) {
    this.landmark = landmark;
    return this;
  }

  /**
   * Get landmark
   * @return landmark
  */
  
  @Schema(name = "landmark", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("landmark")
  public String getLandmark() {
    return landmark;
  }

  public void setLandmark(String landmark) {
    this.landmark = landmark;
  }

  public Address city(String city) {
    this.city = city;
    return this;
  }

  /**
   * Get city
   * @return city
  */
  
  @Schema(name = "city", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("city")
  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public Address district(String district) {
    this.district = district;
    return this;
  }

  /**
   * Get district
   * @return district
  */
  
  @Schema(name = "district", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("district")
  public String getDistrict() {
    return district;
  }

  public void setDistrict(String district) {
    this.district = district;
  }

  public Address state(String state) {
    this.state = state;
    return this;
  }

  /**
   * Get state
   * @return state
  */
  
  @Schema(name = "state", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("state")
  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public Address country(String country) {
    this.country = country;
    return this;
  }

  /**
   * Get country
   * @return country
  */
  
  @Schema(name = "country", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("country")
  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public Address pincode(String pincode) {
    this.pincode = pincode;
    return this;
  }

  /**
   * Get pincode
   * @return pincode
  */
  
  @Schema(name = "pincode", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("pincode")
  public String getPincode() {
    return pincode;
  }

  public void setPincode(String pincode) {
    this.pincode = pincode;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Address address = (Address) o;
    return Objects.equals(this.addressTitle, address.addressTitle) &&
        Objects.equals(this.doorNo, address.doorNo) &&
        Objects.equals(this.plotNo, address.plotNo) &&
        Objects.equals(this.landmark, address.landmark) &&
        Objects.equals(this.city, address.city) &&
        Objects.equals(this.district, address.district) &&
        Objects.equals(this.state, address.state) &&
        Objects.equals(this.country, address.country) &&
        Objects.equals(this.pincode, address.pincode);
  }

  @Override
  public int hashCode() {
    return Objects.hash(addressTitle, doorNo, plotNo, landmark, city, district, state, country, pincode);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Address {\n");
    sb.append("    addressTitle: ").append(toIndentedString(addressTitle)).append("\n");
    sb.append("    doorNo: ").append(toIndentedString(doorNo)).append("\n");
    sb.append("    plotNo: ").append(toIndentedString(plotNo)).append("\n");
    sb.append("    landmark: ").append(toIndentedString(landmark)).append("\n");
    sb.append("    city: ").append(toIndentedString(city)).append("\n");
    sb.append("    district: ").append(toIndentedString(district)).append("\n");
    sb.append("    state: ").append(toIndentedString(state)).append("\n");
    sb.append("    country: ").append(toIndentedString(country)).append("\n");
    sb.append("    pincode: ").append(toIndentedString(pincode)).append("\n");
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

