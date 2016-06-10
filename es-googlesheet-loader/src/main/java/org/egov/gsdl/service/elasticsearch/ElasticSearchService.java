package org.egov.gsdl.service.elasticsearch;

import org.elasticsearch.action.search.SearchAction;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.metrics.stats.StatsBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

@Service
@PropertySource(value = "classpath:elastic-queries.properties")
public class ElasticSearchService {

    @Autowired
    @Qualifier("elasticSearchClient")
    private Client client;

    public String search(String index, String query) {
        QueryBuilder queryBuilder = QueryBuilders.wrapperQuery(query);
        SearchRequestBuilder requestBuilder = new SearchRequestBuilder(client, SearchAction.INSTANCE).
                setIndices(index).setSize(0).
                setQuery(queryBuilder);

        StatsBuilder rangeAgg = AggregationBuilders.stats("stats").field("searchable.totalamount");
        requestBuilder.addAggregation(rangeAgg);
        SearchResponse searchResponse = client.search(requestBuilder.request())
                .actionGet();
        return searchResponse.toString();
    }
}
