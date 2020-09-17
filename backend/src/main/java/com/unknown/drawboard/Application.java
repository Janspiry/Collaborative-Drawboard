package com.unknown.drawboard;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.DataListener;
//import org.mybatis.spring.annotation.MapperScan;
import com.unknown.drawboard.config.shiro.UserRealm;
import com.unknown.drawboard.entity.SocketData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tk.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @author: Janspiry
 * @description: SpringBoot启动类
 * @date: 2020/8/14 20:44
 */
@SpringBootApplication
@MapperScan(basePackages ="com.unknown.drawboard.mapper")
public class Application extends SpringBootServletInitializer {

    private static Logger logger = LoggerFactory.getLogger(UserRealm.class);

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(Application.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);

        //scoket-io监听
        Configuration config = new Configuration();
        config.setHostname("localhost");

        config.setPort(8300);
        //最大帧
        config.setMaxFramePayloadLength(1024 * 1024);
        config.setMaxHttpContentLength(1024 * 1024);

        final SocketIOServer server = new SocketIOServer(config);
        System.out.println("SocketIOServer Listening");
        //画布更新，同步至其他端
        server.addEventListener("report", SocketData.class, new DataListener<SocketData>() {
            @Override
            public void onData(SocketIOClient client, SocketData clientData, AckRequest ackRequest) {
                // broadcast messages to all clients
//                logger.info("SocketIOServer 同步画布 SessionId:"+clientData.getSessionId());
                String sessionId =clientData.getSessionId();
                String password = clientData.getPassword();
                String data = clientData.getData();//后续需要后台验证id与密码的正确性

                clientData.setPassword("");//密码信息进行隐藏
                server.getBroadcastOperations().sendEvent("receive/"+sessionId,clientData);
            }
        });
        //新增协作者或观看者，发送同步请求
        server.addEventListener("synchroToServer", SocketData.class, new DataListener<SocketData>() {
            @Override
            public void onData(SocketIOClient client, SocketData clientData, AckRequest ackRequest) {
                String sessionId =clientData.getSessionId();
//               logger.info("SocketIOServer 同步请求 SessionId:"+clientData.getSessionId());
                //排除发送者自己在前端验证
                server.getBroadcastOperations().sendEvent("synchroFromServer/"+sessionId,"");
            }
        });
        server.start();
        try {
            Thread.sleep(Integer.MAX_VALUE);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        server.stop();
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        // 注意这里要指向原先用main方法执行的Application启动类
        return builder.sources(Application.class);
    }
}
