package org.openapitools.model;

import java.net.URI;
import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import org.openapitools.model.User;
import org.openapitools.jackson.nullable.JsonNullable;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;
import io.swagger.v3.oas.annotations.media.Schema;


import java.util.*;
import javax.annotation.Generated;

/**
 * RequestInfo
 */

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-11-18T09:48:22.341527800+05:30[Asia/Calcutta]")
public class RequestInfo {

  private String apiId;

  private String ver;

  private Long ts;

  private String action;

  private String did;

  private String key;

  private String msgId;

  private String authToken;

  private String correlationId;

  private User userInfo;

  public RequestInfo apiId(String apiId) {
    this.apiId = apiId;
    return this;
  }

  /**
   * Get apiId
   * @return apiId
  */
  
  @Schema(name = "apiId", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("apiId")
  public String getApiId() {
    return apiId;
  }

  public void setApiId(String apiId) {
    this.apiId = apiId;
  }

  public RequestInfo ver(String ver) {
    this.ver = ver;
    return this;
  }

  /**
   * Get ver
   * @return ver
  */
  
  @Schema(name = "ver", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("ver")
  public String getVer() {
    return ver;
  }

  public void setVer(String ver) {
    this.ver = ver;
  }

  public RequestInfo ts(Long ts) {
    this.ts = ts;
    return this;
  }

  /**
   * Get ts
   * @return ts
  */
  
  @Schema(name = "ts", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("ts")
  public Long getTs() {
    return ts;
  }

  public void setTs(Long ts) {
    this.ts = ts;
  }

  public RequestInfo action(String action) {
    this.action = action;
    return this;
  }

  /**
   * Get action
   * @return action
  */
  
  @Schema(name = "action", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("action")
  public String getAction() {
    return action;
  }

  public void setAction(String action) {
    this.action = action;
  }

  public RequestInfo did(String did) {
    this.did = did;
    return this;
  }

  /**
   * Get did
   * @return did
  */
  
  @Schema(name = "did", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("did")
  public String getDid() {
    return did;
  }

  public void setDid(String did) {
    this.did = did;
  }

  public RequestInfo key(String key) {
    this.key = key;
    return this;
  }

  /**
   * Get key
   * @return key
  */
  
  @Schema(name = "key", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("key")
  public String getKey() {
    return key;
  }

  public void setKey(String key) {
    this.key = key;
  }

  public RequestInfo msgId(String msgId) {
    this.msgId = msgId;
    return this;
  }

  /**
   * Get msgId
   * @return msgId
  */
  
  @Schema(name = "msgId", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("msgId")
  public String getMsgId() {
    return msgId;
  }

  public void setMsgId(String msgId) {
    this.msgId = msgId;
  }

  public RequestInfo authToken(String authToken) {
    this.authToken = authToken;
    return this;
  }

  /**
   * Get authToken
   * @return authToken
  */
  
  @Schema(name = "authToken", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("authToken")
  public String getAuthToken() {
    return authToken;
  }

  public void setAuthToken(String authToken) {
    this.authToken = authToken;
  }

  public RequestInfo correlationId(String correlationId) {
    this.correlationId = correlationId;
    return this;
  }

  /**
   * Get correlationId
   * @return correlationId
  */
  
  @Schema(name = "correlationId", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("correlationId")
  public String getCorrelationId() {
    return correlationId;
  }

  public void setCorrelationId(String correlationId) {
    this.correlationId = correlationId;
  }

  public RequestInfo userInfo(User userInfo) {
    this.userInfo = userInfo;
    return this;
  }

  /**
   * Get userInfo
   * @return userInfo
  */
  @Valid 
  @Schema(name = "userInfo", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
  @JsonProperty("userInfo")
  public User getUserInfo() {
    return userInfo;
  }

  public void setUserInfo(User userInfo) {
    this.userInfo = userInfo;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    RequestInfo requestInfo = (RequestInfo) o;
    return Objects.equals(this.apiId, requestInfo.apiId) &&
        Objects.equals(this.ver, requestInfo.ver) &&
        Objects.equals(this.ts, requestInfo.ts) &&
        Objects.equals(this.action, requestInfo.action) &&
        Objects.equals(this.did, requestInfo.did) &&
        Objects.equals(this.key, requestInfo.key) &&
        Objects.equals(this.msgId, requestInfo.msgId) &&
        Objects.equals(this.authToken, requestInfo.authToken) &&
        Objects.equals(this.correlationId, requestInfo.correlationId) &&
        Objects.equals(this.userInfo, requestInfo.userInfo);
  }

  @Override
  public int hashCode() {
    return Objects.hash(apiId, ver, ts, action, did, key, msgId, authToken, correlationId, userInfo);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class RequestInfo {\n");
    sb.append("    apiId: ").append(toIndentedString(apiId)).append("\n");
    sb.append("    ver: ").append(toIndentedString(ver)).append("\n");
    sb.append("    ts: ").append(toIndentedString(ts)).append("\n");
    sb.append("    action: ").append(toIndentedString(action)).append("\n");
    sb.append("    did: ").append(toIndentedString(did)).append("\n");
    sb.append("    key: ").append(toIndentedString(key)).append("\n");
    sb.append("    msgId: ").append(toIndentedString(msgId)).append("\n");
    sb.append("    authToken: ").append(toIndentedString(authToken)).append("\n");
    sb.append("    correlationId: ").append(toIndentedString(correlationId)).append("\n");
    sb.append("    userInfo: ").append(toIndentedString(userInfo)).append("\n");
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

