package com.kbstar.service;

import com.kbstar.dto.Contact;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ContactMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Slf4j
@Service
public class ContactService implements KBService<Integer, Contact> {

    @Autowired
    ContactMapper mapper;

    @Override
    public void register(Contact contact) throws Exception {
        mapper.insert(contact);
    }

    @Override
    public void remove(Integer contactpin) throws Exception {
        mapper.delete(contactpin);
    }

    @Override
    public void modify(Contact contact) throws Exception {
        mapper.update(contact);
    }

    @Override
    public Contact get(Integer contactpin) throws Exception {
        Contact contact =mapper.select(contactpin);
        return contact;
    }

    @Override
    public List<Contact> get() throws Exception {
        List<Contact> list=mapper.selectall();
        return list;
    }
    public void registerResponse(Contact contact) throws Exception {
        mapper.registerResponse(contact);
    }
}
