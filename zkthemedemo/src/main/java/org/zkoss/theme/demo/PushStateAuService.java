package org.zkoss.theme.demo;
import org.zkoss.zk.au.AuRequest;
import org.zkoss.zk.au.AuService;
import org.zkoss.zk.ui.event.Events;

public class PushStateAuService implements AuService {
	private static final String COMMAND_NAME = "onPopupState";

	public boolean service(AuRequest request, boolean everError) {
		if (COMMAND_NAME.equals(request.getCommand())) {
			PopupStateEvent event = PopupStateEvent.getPopupStateEvent(request);
			Events.postEvent(event);
			return true;
		}
		return false;
	}
}
