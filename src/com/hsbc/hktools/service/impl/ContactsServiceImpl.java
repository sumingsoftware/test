package com.hsbc.hktools.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hsbc.hktools.dao.ContactsDao;
import com.hsbc.hktools.entity.Contacts;
import com.hsbc.hktools.service.ContactsService;

@Service
public class ContactsServiceImpl implements ContactsService {
    @Resource
    private ContactsDao contactsDao;

	@Override
	public void insertContact(Contacts Contacts) {
		contactsDao.insertContact(Contacts);
	}

	@Override
	public List<Contacts> getContactsByLimit(int startPos, int pageSize) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startPos", startPos);
		paramMap.put("pageSize", pageSize);
		return contactsDao.getContactsByLimit(paramMap);
	}

	@Override
	public int getContactsCount() {
		return contactsDao.getContactsCount();
	}

	@Override
	public Contacts getContactsById(int ContactsId) {
		return contactsDao.getContactsById(ContactsId);
	}

	@Override
	public List<Contacts> getAllContacts() {
		return contactsDao.getAllContacts();
	}

	@Override
	public List<Contacts> getWarningContacts() {
		return contactsDao.getWarningContacts();
	}

	@Override
	public void updateContact(Contacts contact) {
		contactsDao.updateContact(contact);
	}

	@Override
	public void deleteContact(int contactId) {
		contactsDao.deleteContact(contactId);
		
	}

	@Override
	public List<Contacts> getDayContactListByNameAndGroupId(String name, int groupId) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put("name", name);
		filterMap.put("groupId", String.valueOf(groupId));
		return contactsDao.getDayContactListByNameAndGroupId(filterMap);
	}

	@Override
	public List<Contacts> getDayContactListByGroupId(int groupId) {
		return contactsDao.getDayContactListByGroupId(groupId);
	}

	@Override
	public List<Contacts> getDayContactListByName(String name) {
		return contactsDao.getDayContactListByName(name);
	}
}
