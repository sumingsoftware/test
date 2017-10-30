package com.hsbc.hktools.dao;

import java.util.List;
import java.util.Map;

import com.hsbc.hktools.entity.Contacts;

public interface ContactsDao {
	
	public Contacts getContactsById(int contactsId);
	
    public void insertContact(Contacts contact);
    
    public void updateContact(Contacts contact);
    
    public List<Contacts> getAllContacts();
    
    public List<Contacts> getWarningContacts();
    
    public List<Contacts> getContactsByLimit(Map<String, Integer> paramMap);
    
	public int getContactsCount();
	
	public void deleteContact(int contactId);
	
	public List<Contacts> getDayContactListByNameAndGroupId(Map<String, String> filterMap);

	public List<Contacts> getDayContactListByGroupId(int groupId);

	public List<Contacts> getDayContactListByName(String name);
}
