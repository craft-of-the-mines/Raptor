//
//  umbrella.cpp
//  Raptor
//
//  Created by ライアン on 11/11/18.
//  Copyright © 2018 Craft of the Mines. All rights reserved.
//

#include "../include/raptor.h"
#include "srcon.h"

int TYPE_SERVERDATA_AUTH = 3;
int TYPE_SERVERDATA_EXECCOMMAND = 2;
int TYPE_SERVERDATA_AUTH_RESPONSE = 2;
int TYPE_SERVERDATA_RESPONSE_VALUE = 0;

void* srcon_create(char* address, int port, char* password) {
    return new srcon(std::string(address), port, std::string(password));
}

const char* srcon_send(void* srcon, char* message, int type) {
    auto cast = static_cast<class srcon*>(srcon);
    return cast->send(std::string(message), type).c_str();
}
