package org.egov.gsdl.service.elasticsearch.config;


import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.core.env.Environment;

import java.net.InetSocketAddress;

@Configuration
@ComponentScan(basePackages = "org.egov.gsdl")
public class ElasticSearchConfig {

    @Autowired
    private Environment env;

    @Bean
    @DependsOn("threadPoolTaskScheduler")
    public Client elasticSearchClient() {
        Settings settings = Settings.settingsBuilder()
                .put("cluster.name", searchClusterName()).build();
        Client client = TransportClient.builder().settings(settings).build();
        addTransportClient(client, searchHost(), searchPort());
        return client;
    }

    private TransportClient addTransportClient(Client client, String host, int port) {
        return ((TransportClient) client).addTransportAddress(
                new InetSocketTransportAddress(new InetSocketAddress(host, port)));
    }

    public String searchClusterName() {
        return env.getProperty("es.cluster.name");
    }

    public String searchHost() {
        return env.getProperty("es.host");
    }

    public int searchPort() {
        return env.getProperty("es.port", Integer.class);
    }
}
