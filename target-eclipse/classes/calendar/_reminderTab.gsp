<%@ page import="org.grails.plugins.jquery.calendar.util.CalendarReminderUnitType" %>
<ul>
    <li>
        <label for="units"><g:message code="calendarReminder.minutesBefore"/>:</label>
        <div style="white-space: nowrap">
            <input type="text" id="units" name="units"/>
            <g:select
                    name="unitType"
                    from="${CalendarReminderUnitType.values()}"
                    valueMessagePrefix="calendarReminder.unit" />
        </div>
    </li>
</ul>
