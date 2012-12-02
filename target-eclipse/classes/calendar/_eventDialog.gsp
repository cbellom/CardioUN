<div id="event_edit_container">
    <ul>
        <li><a href="#tabs-event"><g:message code="view.calendarEvent.tabs.event"/></a></li>
        <li><a href="#tabs-reminder"><g:message code="view.calendarEvent.tabs.reminder"/></a></li>
    </ul>

    <form>
        <div id="tabs-event">
            <p>
            <g:render
                    template="/calendar/eventTab"
                    plugin="jquery-calendar"
                    model="[eventTypes: eventTypes]"/>
            </p>
        </div>

        <div id="tabs-reminder">
            <p>
            <g:render
                    template="/calendar/reminderTab"
                    plugin="jquery-calendar" />
            </p>
        </div>
    </form>
</div>