package egovframework.kku.utl.chat;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;

import egovframework.kku.usr.service.EgovKkuChatService;

@EnableWebSocketMessageBroker
@Configuration
@EnableWebMvc
public class StompWebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {

    @Autowired
    private StompHandler stompHandler;	

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/stomp/stomp.do")
                .withSockJS();
    }

    /*어플리케이션 내부에서 사용할 path를 지정할 수 있음*/
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/pub");
        registry.enableSimpleBroker("/sub");
    }
    
    
    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        registration.setInterceptors(stompHandler);
    }   

    @Override
    public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
        registry.setMessageSizeLimit(50 * 1024 * 1024); //this not work todo
        registry.setSendBufferSizeLimit(50 * 1024 * 1024);
        registry.setDecoratorFactories(agentWebSocketHandlerDecoratorFactory());
    }

  @Bean
        public  AgentWebSocketHandlerDecoratorFactory agentWebSocketHandlerDecoratorFactory() {
        return new AgentWebSocketHandlerDecoratorFactory();
    }
}