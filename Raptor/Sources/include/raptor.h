//
//  umbrella.h
//  Raptor
//
//  Created by ライアン on 11/11/18.
//  Copyright © 2018 Craft of the Mines. All rights reserved.
//

#ifndef umbrella_h
#define umbrella_h

#ifdef __cplusplus
extern "C" {
#endif
    
    extern int TYPE_SERVERDATA_AUTH;
    extern int TYPE_SERVERDATA_EXECCOMMAND;
    extern int TYPE_SERVERDATA_AUTH_RESPONSE;
    extern int TYPE_SERVERDATA_RESPONSE_VALUE;
    
    void* srcon_create(char* address, int port, char* password);
    const char* srcon_send(void* srcon, char* message, int type);
#ifdef __cplusplus
}
#endif

#endif /* umbrella_h */
