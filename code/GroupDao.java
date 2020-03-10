package com._4paradigm.dlpservice.dao;

import com._4paradigm.dlpservice.domain.Group;
import com._4paradigm.dlpservice.domain.InviteCode;
import com._4paradigm.dlpservice.domain.PDMSSyncTime;
import org.bson.types.ObjectId;

import java.util.Date;

public interface GroupDao
{
    void saveGroup(Group Group);
    Group retrieveGroupById(ObjectId groupId);

    InviteCode retrieveInviteCode(String code);

    void removeInviteCode(ObjectId id);

    PDMSSyncTime retrieveSyncTime();

    void setSyncTime(Date date);
}
