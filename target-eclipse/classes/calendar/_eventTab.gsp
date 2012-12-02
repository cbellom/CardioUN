<ul>
    <li>
        <span><g:message code="calendarEvent.date"/> :</span>
        <span class="date_holder"></span>
    </li>
    <li>
        <label for="eventType"><g:message code="calendarEvent.eventType"/>:</label>
        <g:select
                name="eventType"
                from="${eventTypes}"
                optionKey="id"
                noSelection="['': message(code: 'view.calendarEvent.eventType.choose')]"
                valueMessagePrefix="calendarEventType" />
    </li>
    <li>
        <label for="start"><g:message code="calendarEvent.startDate"/>:</label>
        <g:select
                name="start"
                from="[]"
                noSelection="['': message(code: 'view.calendarEvent.startDate.choose')]"/>
    </li>
    <li>
        <label for="end"><g:message code="calendarEvent.endDate"/>:</label>
        <g:select
                name="end"
                from="[]"
                noSelection="['': message(code: 'view.calendarEvent.endDate.choose')]"/>
    </li>
    <li>
        <label for="name"><g:message code="calendarEvent.name"/>:</label>
        <input type="text" id="name" name="name"/>
    </li>
    <li>
        <label for="description"><g:message code="calendarEvent.description"/>:</label>
        <textarea id="description" name="description"></textarea>
    </li>
    <li>
        <label for="location"><g:message code="calendarEvent.location"/>:</label>
        <textarea id="location" name="location"></textarea>
    </li>
</ul>