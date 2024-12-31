package com.yeohaeng_ttukttak.server.common.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import java.util.List;

@JsonPropertyOrder({"_metadata", "records"})
public interface InfiniteScrollResult<T> {

    @JsonProperty("_metadata")
    InfiniteScrollMetadata metadata();

    @JsonProperty("records")
    List<T> records();

}
