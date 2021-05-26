package com.opsway.react;

import android.content.Context;

import com.clevertap.android.sdk.inbox.CTInboxMessage;
import com.clevertap.android.sdk.CleverTapAPI;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.google.gson.Gson;

import java.util.ArrayList;

import me.leolin.shortcutbadger.ShortcutBadger;

public class RNCleverTapInboxModule extends ReactContextBaseJavaModule {

	private final ReactApplicationContext reactContext;
	private final Context context;
	private final CleverTapAPI cleverTapDefaultInstance;

	RNCleverTapInboxModule(ReactApplicationContext reactContext) {
		super(reactContext);
		this.reactContext = reactContext;
		this.context = reactContext.getApplicationContext();
		cleverTapDefaultInstance = CleverTapAPI.getDefaultInstance(this.context);
	}

	//Initialize App Inbox

	@SuppressWarnings({"unused"})
	@ReactMethod
	public void initializeInbox() {
		cleverTapDefaultInstance.initializeInbox();
	}

	//Get Inbox Message Count

	@SuppressWarnings({"unused"})
	@ReactMethod
	public void getInboxMessageCount(Promise promise) {
		try {
			int count = cleverTapDefaultInstance.getInboxMessageCount();
			promise.resolve(count);
		} catch (Throwable e) {
			promise.reject(e);
		}
	}

	//Get Inbox Unread Count

	@SuppressWarnings({"unused"})
	@ReactMethod
	public void getInboxMessageUnreadCount(Promise promise) {
		try {
			int count = cleverTapDefaultInstance.getInboxMessageUnreadCount();
			ShortcutBadger.applyCount(this.context, count);
			promise.resolve(count);
		} catch (Throwable e) {
			promise.reject(e);
		}
	}

	//Get All messages

	@SuppressWarnings({"unused"})
	@ReactMethod
	public void getAllInboxMessages(Promise promise) {
		try {
			ArrayList<CTInboxMessage> messages = cleverTapDefaultInstance.getAllInboxMessages();
			String json = new Gson().toJson(messages);
			promise.resolve(json);
		} catch (Throwable e) {
			promise.reject(e);
		}
	}

	//Get only Unread messages

	@SuppressWarnings({"unused"})
	@ReactMethod
	public void getUnreadInboxMessages(Promise promise) {
		try {
			ArrayList<CTInboxMessage> messages = cleverTapDefaultInstance.getUnreadInboxMessages();
			String json = new Gson().toJson(messages);
			promise.resolve(json);
		} catch (Throwable e) {
			promise.reject(e);
		}
	}

	//Get message object belonging to the given message id only. Message id should be a String

	@SuppressWarnings({"unused"})
	@ReactMethod
	public CTInboxMessage getInboxMessageForId(String messageId) {
		return cleverTapDefaultInstance.getInboxMessageForId(messageId);
	}

	//Mark all Unread messages as Read

	@SuppressWarnings({"unused"})
	@ReactMethod
	public void markReadAllUnreadInboxMessages(Promise promise) {
		try {
			ArrayList<CTInboxMessage> messages = cleverTapDefaultInstance.getUnreadInboxMessages();
			for (CTInboxMessage message: messages) {
				cleverTapDefaultInstance.markReadInboxMessage(message);
			}
			ShortcutBadger.removeCount(this.context);
			promise.resolve(true);
		} catch (Throwable e) {
			promise.reject(e);
		}
	}

	//Mark Message as Read

	@SuppressWarnings({"unused"})
	@ReactMethod
	public void markReadInboxMessage(String messageId, Promise promise) {
		try {
			CTInboxMessage message = cleverTapDefaultInstance.getInboxMessageForId(messageId);
			cleverTapDefaultInstance.markReadInboxMessage(message);
			promise.resolve(true);
		} catch (Throwable e) {
			promise.reject(e);
		}
	}

	//Delete message from the Inbox

	@SuppressWarnings({"unused"})
	@ReactMethod
	public void deleteInboxMessage(String messageId, Promise promise) {
		try {
			CTInboxMessage message = cleverTapDefaultInstance.getInboxMessageForId(messageId);
			cleverTapDefaultInstance.deleteInboxMessage(message);
			promise.resolve(true);
		} catch (Throwable e) {
			promise.reject(e);
		}
	}

	@Override
	public String getName() {
		return "RNCleverTapInbox";
	}
}
