package com.f5infosol.businessbudgeter.common;


public class Queries {

	// public static final String GET_USER_BY_USERNAME =
	// "select u.userid, u.fullname, u.username, u.password, u.cellno, u.emailid,"
	// + "u.validafter, u.validbefore, u.failedloginscount" +
	// "from accessuser u " + "where upper(u.username) = upper(?)";

	public static final String GET_USER_BY_USERNAME = "select u.userid, u.firstname, u.lastname, u.username, u.password, u.cellno, u.emailid, u.validafter, u.validbefore, u.failedloginscount from accessuser u where upper(u.username) = upper(?)";

	public static final String GET_CASHUP_ONE_BY_DATE = "select cash_type_name,* from cashup_cash ,cash_types, income_centres  where cashup_cash.cash_type_id = cash_types.cash_type_id and cash_drawer_id = ? and cashup_cash_date = ? and service_id = ? and incomecenter_id = ? and income_centres.income_centre_id = cashup_cash.incomecenter_id order by cashup_cash.cash_type_id desc";

	public static final String UPDATE_CASHUP_ONE_BY_DATE = "update cashup_cash set float_amount=? ,drawer_amount=? ,updated_on=? ,updated_by=? where cashup_cash_date=? and service_id = ? and cashup_cash_id = ? and incomecenter_id = ?";

	public static final String GET_SALES_BY_DATE = "select * from cash_sales where cashup_cash_date = ? and service_id = ? and income_center_id=?";

	public static final String GET_ALL_SERVICES = "select * from services order by service_id Asc";

	/*public static final String UPDATE_SALES_BY_DATE = "UPDATE cash_sales SET  food_beverage_sales=?, event_food_beverage_sales=?, food_sales_amt=?, beverage_sales_amt=?, event_food_sales_amt=?, event_beverage_sales_amt=?, updated_on=?, updated_by=?, bar_food_beverage_sales=?, catering_food_beverage_sales=?, retail_food_beverage_sales=?, room_service_food_beverage_sales=?, bar_food_sales_amt=?, bar_beverage_sales_amt=?, catering_food_sales_amt=?, catering_beverage_sales_amt=?, retail_food_sales_amt=?, retail_beverage_sales_amt=?, room_service_food_sales_amt=?, room_service_beverage_sales_amt=? WHERE cash_sales_id=? and cashup_cash_date=? and service_id=? and income_center_id=?";*/

	public static final String UPDATE_SALES_BY_DATE = "UPDATE cash_sales SET restaurant_covers=?, restaurant_food_sales=?, restaurant_beverage_sales=?, restaurant_other_sales=?, cafe_covers=?, cafe_food_sales=?, cafe_beverage_sales=?, cafe_other_sales=?, "
													+ " takeaway_covers=?, takeaway_food_sales=?, takeaway_beverage_sales=?,    takeaway_other_sales=?, bar_covers=?, bar_food_sales=?, bar_beverage_sales=?, bar_other_sales=?, deli_covers=?, deli_food_sales=?, "
													+ "	deli_beverage_sales=?, deli_other_sales=?, retail_covers=?, retail_food_sales=?, retail_beverage_sales=?, retail_other_sales=?, catering_covers=?, catering_food_sales=?, catering_beverage_sales=?, catering_other_sales=?, "
													+ "	delivery_covers=?, delivery_food_sales=?, delivery_beverage_sales=?, delivery_other_sales=?, event_covers=?, event_food_sales=?, event_beverage_sales=?, event_other_sales=?, room_service_covers=?, room_service_food_sales=?, "
													+ " room_service_beverage_sales=?, room_service_other_sales=?, custom1_covers=?, custom1_food_sales=?, custom1_beverage_sales=?, custom1_other_sales=?, custom2_covers=?, custom2_food_sales=?, custom2_beverage_sales=?, custom2_other_sales=?, "
													+ " updated_on=?, updated_by=? WHERE cash_sales_id=? and cashup_cash_date=? and service_id=? and income_center_id=?";
	
	/*public static final String UPDATE_CREDIT_BY_DATE = "UPDATE cashup_credit_card SET cc_reading=? ,till_reading=? ,updated_on=? ,updated_by=? WHERE credit_card_type_id=? and cashup_credit_date=? and service_id = ? and income_center_id=?";*/
	
	public static final String UPDATE_CREDIT_BY_DATE = "UPDATE cashup_credit_card SET cc_reading=?, till_reading=?, updated_on=?, updated_by=? WHERE credit_card_type_id=? and cashup_credit_date=? and service_id = ? and income_center_id=?";

	public static final String CARD_QUERY = "SELECT * FROM CASHUP_CREDIT_CARD WHERE CASHUP_CREDIT_DATE  = ? AND SERVICE_ID = ? AND INCOME_CENTER_ID = ? ORDER BY CREDIT_CARD_TYPE_ID";

	public static final String GET_CASHUP_TWO_BY_DATE = "select cash_type_name,* from cashup_cash ,cash_types  where cashup_cash.cash_type_id = cash_types.cash_type_id and cash_drawer_id = 3 and cashup_cash_date = ? and service_id = ? order by cashup_cash.cash_type_id desc";

	public static final String UPDATE_CASHUP_TWO_BY_DATE = "update cashup_cash set float_amount=? ,drawer_amount=? ,updated_on=? ,updated_by=? where cashup_cash_date=? and service_id = ? and cashup_cash_id = ?";

	public static final String PURCHASE_LIST_QUERY = "SELECT * FROM CASHUP_PURCHASES WHERE SERVICE_ID = ? AND PURCHASES_DATE = ? AND PURCHASE_TYPE = 'food' AND INCOME_CENTER_ID = ? ";

	public static final String PURCHASE_BEVERAGE_LIST_QUERY = "SELECT * FROM CASHUP_PURCHASES WHERE SERVICE_ID = ? AND PURCHASES_DATE = ? AND PURCHASE_TYPE = 'beverage' AND INCOME_CENTER_ID = ?";

	public static final String GET_CASHUP_VOID_BY_DATE = "select staff_name,* from staff,cashup_voids where staff.staff_id = cashup_voids.staff_id and cashup_void_date = ? and service_id = ? and income_center_id = ?";

	public static final String UPDATE_CASHUP_VOID_BY_DATE = "UPDATE cashup_voids SET staff_id=? ,amount=? ,time=? ,reason=? ,updated_on=? ,updated_by=? WHERE cashup_voids_id=? and cashup_void_date=? and service_id = ? and income_center_id=?";

	public static final String PURCHASE_FOOD_UPDATE_QRY = "update cashup_purchases SET purchase_name = ? , purchase_cost = ? ,updated_on=? ,updated_by=? where purchase_id = ? and purchases_date = ? and service_id = ? and income_center_id = ?";

	public static final String PURCHASE_BEVERAGE_UPDATE_QRY = "update cashup_purchases SET purchase_name = ? , purchase_cost = ? ,updated_on=? ,updated_by=? where purchase_id = ? and purchases_date = ? and service_id = ? and income_center_id = ? ";

	public static final String GET_TIPS_BY_DATE = "select * from cashup_tips where tips_date = ? and service_id = ? and income_center_id = ?";

	public static final String UPDATE_CASHUP_TIPS_BY_DATE = "update cashup_tips set cash_tips=? ,credit_card_tips=? ,updated_on=? ,updated_by=? where tips_date=? and service_id=? and cashup_tips_id=? and income_center_id = ?";

	public static final String INSERT_CASHUP_CASH = "INSERT INTO cashup_cash(service_id, cash_drawer_id, cash_type_id, float_amount, drawer_amount, cashup_cash_date, updated_by, incomecenter_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String SEARCH_STAFF_BY_NAME = "select * from staff where lower(staff_name || position || agency || level) like lower(?) order by lower(staff_name || position || agency || level)";

	/*public static final String INSERT_CASHUP_CARD = "INSERT INTO cashup_credit_card(service_id, credit_card_type_id, cc_reading, till_reading, updated_by, cashup_credit_date, income_center_id) VALUES (?, ?, ?, ?, ?, ?, ? )";*/
	
	public static final String INSERT_CASHUP_CARD = "INSERT INTO cashup_credit_card(service_id, credit_card_type_id, cc_reading, till_reading, updated_by, cashup_credit_date, income_center_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

	public static final String INSERT_CASHUP_TIPS = "INSERT INTO cashup_tips(service_id, updated_by, cash_tips, tips_date, credit_card_tips, income_center_id, fees_pct, slush_pct ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String INSERT_CASHUP_PURCHASE = "INSERT INTO cashup_purchases(service_id, purchase_name, purchase_type, updated_by, purchases_date, purchase_cost, income_center_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

	public static final String INSERT_CASHUP_VOID = "INSERT INTO cashup_voids(staff_id, service_id, amount, time, reason, updated_by, cashup_void_date, income_center_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String GET_TILL_DETAILS = "select * from cash_drawers where user_id = ? and income_centre_id = ? order by cash_drawer_id";

	public static final String GET_CASHUP_SALES_BY_DATE = "select * from  income_centres i , cashup_sales c where income_centre_id =2 and c.service_id = 1 and cashup_sales_date = '2014-12-24'";

	public static final String GET_INCOME_CENTER = "select * from  income_centres where income_centre_id = ?";

	public static final String GET_CASHUP_SALES_BY_DATE_SERVICE = "select * from cashup_sales  where cashup_sales_date = ? and service_id = ?";

	//public static final String INSERT_CASHUP_SALES = "INSERT INTO cash_sales(cash_sales_id, service_id, food_beverage_sales, event_food_beverage_sales, food_sales_amt, beverage_sales_amt, event_food_sales_amt, event_beverage_sales_amt, cashup_cash_date, updated_by, bar_food_beverage_sales, catering_food_beverage_sales, retail_food_beverage_sales, room_service_food_beverage_sales, bar_food_sales_amt, bar_beverage_sales_amt, catering_food_sales_amt, catering_beverage_sales_amt, retail_food_sales_amt, retail_beverage_sales_amt, room_service_food_sales_amt, room_service_beverage_sales_amt, income_center_id) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String INSERT_CASHUP_SALES = "INSERT INTO cash_sales(cash_sales_id, service_id, income_center_id, restaurant_covers, restaurant_food_sales, restaurant_beverage_sales, restaurant_other_sales,"
													+ " cafe_covers, cafe_food_sales, cafe_beverage_sales, cafe_other_sales, takeaway_covers, takeaway_food_sales, takeaway_beverage_sales, takeaway_other_sales, bar_covers, bar_food_sales,"
													+ " bar_beverage_sales, bar_other_sales, deli_covers, deli_food_sales, deli_beverage_sales, deli_other_sales, retail_covers, retail_food_sales, retail_beverage_sales, retail_other_sales, catering_covers, catering_food_sales,"
													+ " catering_beverage_sales, catering_other_sales, delivery_covers, delivery_food_sales, delivery_beverage_sales, delivery_other_sales, event_covers, event_food_sales,"
													+ " event_beverage_sales, event_other_sales, room_service_covers, room_service_food_sales, room_service_beverage_sales, room_service_other_sales, "
													+ "custom1_covers, custom1_food_sales, custom1_beverage_sales, custom1_other_sales, custom2_covers, custom2_food_sales, custom2_beverage_sales, custom2_other_sales, cashup_cash_date, updated_by)"
													+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
													+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	public static final String GET_INCOME_CENTER_LIST = "select * from income_centres where is_enable=true order by ic_name";

	public static final String GET_SERVICES_BY_INCOME_CENTER = "select * from services where income_centre_id = ? order by service_id Asc ";

	public static final String GET_SERVICES_TIME = "select * from services where service_id = ?";

	public static final String GET_Z_READ_BY_DATE = "select * from cashup_z_read where cashup_zread_date = ? and service_id = ? and income_center_id=?";

	public static final String INSERT_CASHUP_Z_READ = "INSERT INTO cashup_z_read(service_id, z_read, updated_by, cashup_zread_date, income_center_id) VALUES (?, ?, ?, ?, ?)";

	public static final String UPDATE_Z_READ = "UPDATE cashup_z_read SET z_read=? ,updated_on=? ,updated_by=? WHERE cashup_z_read_id=? and service_id=? and cashup_zread_date=? and income_center_id=?";

	public static final String SEARCH_STAFF_NAME = "select * from staff where lower(staff_name) like lower(?) order by lower(staff_name)";

	public static final String SEARCH_STAFF_ID_BY_NAME = "select * from staff where staff_id = ?";

	public static final String GET_EVENTS = "select * from events";

	public static final String INSERT_ROSTER_EVENT = "INSERT INTO roster_event(event_id, income_center_id, roster_event_date, updated_by) VALUES (?, ?, ?, ?)";

	public static final String GET_ROSTER_EVENTS = "select * from events e, roster_event r where e.event_id = r.event_id and roster_event_date = ? and income_center_id = ?";

	public static final String GET_STAFF = "select * from staff order by staff_id asc";

	public static final String INSERT_ROSTER_SHIFT = "INSERT INTO roster(shift_id, income_center_id, roster_date, start_time, finish_time, updated_by) VALUES (?, ?, ?, ?, ?, ?)";

	public static final String GET_SHIFT = "select * from roster_shift";

	public static final String GET_STAFF_SHIFT_ROSTER = "select * from roster where roster_date = ? and income_center_id = ?";

	public static final String INSERT_ROSTER_SHIFT_DEFAULT = "INSERT INTO roster(shift_id, income_center_id, roster_date, start_time, finish_time, updated_by) VALUES (?, ?, ?, ?, ?, ?)";

	public static final String ALLOCATE_ROSTER_SERVICE = "UPDATE roster SET service_id=? ,updated_on=? ,updated_by=? WHERE shift_id=? and income_center_id=? and roster_date=?";

	public static final String ALLOCATE_ROSTER_EVENT = "UPDATE roster SET event_id=? ,updated_on=? ,updated_by=? WHERE shift_id=? and income_center_id=? and roster_date=?";

	public static final String GET_SHIFT_FOR_ROSTER = "select distinct rs.shift_id, rs.shift_name from roster_shift rs, roster r where rs.shift_id = r.shift_id  and income_center_id = ? and roster_date = ? ";

	public static final String IS_STAFF_ALREADYALLOCATEQUERY = "select count(*) as count from roster where shift_id = ? and staff_id = ? and roster_date = ? and income_center_id = ? ";

	public static final String GET_SHIFT_TIME = "select * from roster_shift where shift_id=?";

	public static final String GET_SERVICES_NAME = "select * from services where service_id = ?";

	public static final String IS_SHIFT_ALLOCATED = "select count(*) as count from roster where shift_id =  ? and roster_date = ? and income_center_id = ? and staff_id is not null";

	public static final String GET_SHIFT_START_END_TIME = "select * from roster_shift where shift_id = ?";

	public static final String INSERT_NEW_ROSTER_SHIFT = "INSERT INTO roster(shift_id, staff_id, income_center_id, roster_date, start_time, finish_time, updated_by) VALUES (?, ?, ?, ?, ?, ?, ?)";

	public static final String UPDATE_STAFF_SHIFT_ROSTER = "UPDATE roster SET staff_id= ? ,updated_on=? ,updated_by=? WHERE shift_id=? and income_center_id=? and roster_date=?";

	public static final String ROSTER_DETAILS_QRY = "select * from roster where income_center_id = ?  and   roster_date = ? order by staff_id ";

	// public static final String ROSTER_DETAILS_QRY =
	// "select * from roster, roster_shift, staff where roster.shift_id = roster_shift.shift_id and roster.staff_id = staff.staff_id and income_center_id = ? and  roster_date = ? order by roster.staff_id ";

	// public static final String ROSTER_DETAILS_QRY =
	// "select * from roster, roster_shift, staff, services, events where roster.shift_id = roster_shift.shift_id and roster.staff_id = staff.staff_id and roster.event_id = events.event_id and roster.service_id = services.service_id and income_center_id = ? and  roster_date = ? order by roster.staff_id ";

	public static final String GET_STAFF_NAME = "select * from staff where staff_id = ?";

	public static final String GET_EVENT_NAME = "select * from events where event_id = ?";

	public static final String GET_SERVICE_NAME = "select * from services where service_id = ?";

	// public static final String GET_STAFF_SHIFT_ROSTER =
	// "select * from staff_rosters, staff where staff_rosters.staff_id = staff.staff_id and roster_date = ? and income_center_id = ?";

	// public static final String INSERT_ROSTER_SHIFT_DEFAULT
	// ="INSERT INTO staff_rosters(staff_id, roster_date, start_time, finish_time, updated_by, income_center_id) VALUES (?, ?, ?, ?, ?, ?)";

	public static final String INSERT_ROSTER_SHIFT_STAFF = "INSERT INTO staff_rosters(staff_id, roster_date, start_time, finish_time, total_hours, updated_by, income_center_id , boh_foh, role,  public_holiday) VALUES (?, ?, ?, ?, ?, ?, ? , ?, ?, ?) ";

	//public static final String UPDATE_ROSTER_SHIFT_STAFF = "update staff_rosters set start_time = ?, finish_time = ?, total_hours = ? where satff_roster_id = ?";

	public static final String UPDATE_ROSTER_SHIFT_STAFF = "UPDATE staff_rosters SET  staff_id=?, roster_date=?, start_time=?, finish_time=?, total_hours=?, updated_on=?, updated_by=?, income_center_id=?, boh_foh=?, role=?  WHERE satff_roster_id=?";
	
	public static final String REMOVE_STAFF = "delete from roster where staff_id  = ? and roster_date = ?";

	public static final String GET_STAFF_ROSTERS_BOH = "select * from staff_rosters where income_center_id = ?  and   roster_date = ? and boh_foh = ? order by staff_id ";

	public static final String REMOVE_STAFF_ROSTERS = "delete from staff_rosters where staff_id  = ? and roster_date = ? and income_center_id=? ";

	public static final String REMOVE_STAFF_EVENT = "delete from staff_rosters_events where staff_id  = ? and roster_date = ? and income_center_id=? ";

	public static final String REMOVE_STAFF_SERVICES = "delete from staff_rosters_services where staff_id  = ? and roster_date = ? and income_center_id=? ";;

	public static final String REMOVE_SATFF_ROSTER = "delete from staff_rosters where satff_roster_id  = ? and income_center_id=? ";

	public static final String GET_STAFF_ROSTERS_SERVICES = "select * from staff_rosters_services where income_center_id = ? and roster_date = ? order by staff_id ";

	public static final String ALLOCATE_ROSTER_SERVICE_TO_STAFF = "INSERT INTO staff_rosters_services(service_id, satff_roster_id, staff_id, roster_date, no_of_hours, updated_by, income_center_id, eligible_for_tips) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

	public static final String ALLOCATE_ROSTER_EVENT_TO_STAFF = "INSERT INTO staff_rosters_events(event_id, staff_id, no_of_hours, roster_date, updated_by, income_center_id, eligible_for_tips) VALUES (?, ?, ?, ?, ?, ?, ?);";

	public static final String GET_STAFF_ROSTERS_EVENTS = "select * from staff_rosters_events where income_center_id = ? and roster_date = ? order by staff_id ";

	public static final String UPDATE_STAFF_ROSTERS_SERVICES = "update staff_rosters_services set no_of_hours = ? where satff_roster_service_id = ?";

	public static final String UPDATE_STAFF_ROSTERS_EVENTS = "update staff_rosters_events set no_of_hours = ? where satff_roster_event_id = ?";

	public static final String SEARCH_STAFF_FOR_SERVICE_NAME = "select distinct staff_rosters.staff_id, staff_name  from staff_rosters ,staff where lower(staff_name) like lower(?) and staff.staff_id = staff_rosters.staff_id and roster_date = ?";

	public static final String GET_SERVICE_STAFF_NAME = " select * from staff,staff_rosters where staff.staff_id = staff_rosters.staff_id and satff_roster_id =?";

	public static final String GET_WORK_OF_HOUSE_LIST = "select * from staff_rosters";

	public static final String GET_STAFF_ROSTERS_FOH = "select * from staff_rosters where income_center_id = ?  and   roster_date = ? and boh_foh = ? order by staff_id ";

	public static final String GET_STAFF_ROSTERS_ALL = "select * from staff_rosters where income_center_id = ?  and   roster_date = ?  order by staff_id ";

	public static final String GET_STAFF_DETAILS = "select * from staff where staff_id=?";

	public static final String UPDATE_STAFF_DETAIL = "UPDATE staff SET staff_name=?, address=?, position=?, level=?, week_day_rate=?, saturday_day_rate=?, sunday_day_rate=?, public_holiday_day_rate=?, other_rate=?, employee_status=?, agency=?, setting=?, roster=?, cashup=?, report=?, updated_on=?, updated_by=?, emailid=?, cellno=? , postal_code=? WHERE staff_id=?";

	public static final String INSERT_NEW_STAFF = "INSERT INTO staff(company_id, staff_name, address, position, level, week_day_rate, saturday_day_rate, sunday_day_rate, public_holiday_day_rate, other_rate, employee_status, agency, updated_by, emailid, cellno,postal_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String GET_EVENT_DETAILS = "select * from events order by event_id asc";

	public static final String SEARCH_EVENT_BY_NAME = "select * from events where lower(event_name) like lower(?) order by lower(event_name)";

	public static final String GET_EVENT_DETAILS_BY_ID = "select * from events where event_id = ?";

	public static final String UPDATE_EVENT_DETAIL = "UPDATE events SET  event_name=?, food_budgeted_income=?, food_actual=?, beverage_budgeted_income=?, beverage_actual=?, other_budgeted_income=?, other_actual=?, total_budgeted_income=?, total_actual=?, labour_cost_pct=?, updated_on=?, updated_by=?  WHERE event_id=?";

	public static final String INSERT_NEW_EVENT = "INSERT INTO events(event_name, food_budgeted_income, food_actual, beverage_budgeted_income, beverage_actual, other_budgeted_income, other_actual, total_budgeted_income, total_actual, labour_cost_pct, updated_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String SEARCH_USER_BY_NAME = "select * from accessuser where lower(username) like lower(?) order by lower(username)";

	public static final String GET_USER_DETAILS = "select * from accessuser where userid=?";

	public static final String UPDATE_USER_DETAIL = "UPDATE accessuser SET fullname=?, username=?, password=?, company_name=?  WHERE userid=?";

	public static final String INSERT_NEW_USER = "INSERT INTO accessuser(company_id, fullname, username, password, company_name) VALUES (?, ?, ?, ?, ?)";

	public static final String GET_USER = "select * from accessuser order by userid asc";

	public static final String UPDATE_PASSWORD = "UPDATE accessuser SET  password=?  WHERE userid=?";

	public static final String GET_ALL_USER_DETAILS = "select * from accessuser";

	public static final String GET_USER_BY_USERNAME_AND_EMAIL = "select * from accessuser where username=? AND emailid =?";

	public static final String RESET_PASSWORD = "UPDATE accessuser SET password = ? WHERE username =?";

	public static final String GET_CASH_DRAWER = "select * from cash_drawers";
	
	public static final String GET_CASH_DRAWER_DETAILS = "select * from cash_drawers where cash_drawer_id = ?";

	public static final String UPDATE_CASH_DRAWER = "UPDATE cash_drawers SET  user_id=?, income_centre_id=?, till_name=?, description=?, updated_on=?, updated_by=? WHERE cash_drawer_id=?";

	public static final String INSERT_NEW_CASH_DRAWER = "INSERT INTO cash_drawers(user_id, income_centre_id, till_name, description, updated_by) VALUES (?, ?, ?, ?, ?)";

	public static final String SEARCH_DRAWER_BY_NAME = "select * from cash_drawers where income_centre_id = ? and lower(till_name) like lower(?) order by lower(till_name) ";

	public static final String UPDATE_SERVICE_DETAIL = "UPDATE services SET service_name=?, income_centre_id=?, description=?, recurrence=?, start_time=?, end_time=?, start_date=?, revenue_projection=?, labour_cost_pct=?, updated_on=?, updated_by=? WHERE service_id=?";

	public static final String INSERT_NEW_SERVICE = "INSERT INTO services(service_name, income_centre_id, description, recurrence, start_time, end_time, start_date, revenue_projection, labour_cost_pct, updated_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String SEARCH_SERVICE_BY_NAME = "select * from services where income_centre_id = ? and lower(service_name) like lower(?) order by lower(service_name)";

	public static final String GET_ALL_INCOME_CENTER = "select * from income_centres,companies where income_centres.company_id = companies.company_id";

	public static final String SEARCH_INCOME_CENTER_BY_NAME = "select * from income_centres where lower(ic_name) like lower(?) order by lower(ic_name)";

	public static final String GET_INCOME_CENTER_BY_ID = "select * from income_centres where income_centre_id = ?";

	//public static final String UPDATE_INCOMECENTER = "UPDATE income_centres SET company_id=?, ic_name=?, location=?, details=?, food_sales=?, beverage_sales=?, bar_food_sales=?, bar_beverage_sales=?, event_food_sales=?, event_beverage_sales=?, catering_food_sales=?, catering_beverage_sales=?, retail_food_sales=?, retail_beverage_sales=?, room_service_food_sales=?, room_service_beverage_sales=?, updated_on=?, updated_by=?, slush_pct=?, fees_pct=?, food_cost_pct=?, bev_cost_pct=?, food_income_pct=?, beverage_income_pct=? WHERE income_centre_id=?";

	public static final String UPDATE_INCOMECENTER = "UPDATE income_centres SET  company_id=?, ic_name=?, location=?, details=?, restaurant=?, cafe=?, takeaway=?, bar=?, deli=?, retail=?, catering=?," 
											       			+"delivery=?, event=?, room_service=?, custom1=?, custom2=?, updated_on=?, updated_by=?, slush_pct=?, fees_pct=?, food_cost_pct=?, "
											       			+"bev_cost_pct=?, food_income_pct=?, beverage_income_pct=?  WHERE income_centre_id=?";
	
	//public static final String INSERT_NEW_INCOMECENTER = "INSERT INTO income_centres(company_id, ic_name, location, details, food_sales, beverage_sales, bar_food_sales, bar_beverage_sales, event_food_sales, event_beverage_sales, catering_food_sales, catering_beverage_sales, retail_food_sales, retail_beverage_sales, room_service_food_sales, room_service_beverage_sales, updated_by, slush_pct, fees_pct, food_cost_pct, bev_cost_pct, food_income_pct, beverage_income_pct) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	public static final String INSERT_NEW_INCOMECENTER = "INSERT INTO income_centres(company_id, ic_name, location, details, restaurant,cafe, takeaway, bar, deli, retail, catering, delivery, event," 
			   											  	+"room_service, custom1, custom2, updated_by, slush_pct, fees_pct, food_cost_pct, bev_cost_pct, food_income_pct, beverage_income_pct,weekly_turnover)"
			   											  	+"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

	public static final String GET_COMPANYNAME = "select * from companies";

	public static final String INCOME_CENTER_BY_COMPANY = "select * from income_centres where company_id = ? order by ic_name Asc";

	public static final String GET_CASH_DRAWER_FOR_INCOME_CENTER = "select * from cash_drawers where income_centre_id = ?";

	public static final String INSERT_NEW_ACCESSUSER = "INSERT INTO accessuser(userid, password, staff_id) VALUES (?, ?, ?)";

	public static String UPDATE_ACCESSUSER_DETAIL = "UPDATE accessuser SET userid=?, password=? WHERE staff_id=?";

	/*public static final String GET_ALL_EVENTS_LIST_RESULT = "SELECT  * FROM roster_event,events where roster_event.event_id = events.event_id AND  roster_event_date >= now()::date order by roster_event_date Asc";*/
	
	public static final String GET_ALL_EVENTS_LIST_RESULT = "SELECT  * FROM roster_event,events where roster_event.event_id = events.event_id  order by roster_event_date Asc";

	public static final String SEARCH_ALL_EVENT_BY_NAME = "SELECT  * FROM  events WHERE  lower(event_name) like lower(?) order by lower(event_name)";

	public static final String SEARCH_ALL_EVENTS_LIST_WITH_ID_AND_DURATION = "SELECT * FROM roster_event,events WHERE  roster_event.event_id = events.event_id AND roster_event_date BETWEEN ? AND ? AND roster_event.event_id = ?  order by roster_event_date desc";

	public static final String SEARCH_ALL_EVENTS_LIST_FOR_DURATION = "SELECT * FROM roster_event,events WHERE  roster_event.event_id = events.event_id AND roster_event_date BETWEEN ? AND ? order by roster_event_date desc";

	public static final String SEARCH_ALL_EVENTS_LIST_BY_DATE = "SELECT * FROM roster_event,events WHERE  roster_event.event_id = events.event_id AND roster_event_date=?";

	public static final String GET_ACCESSUSER_DETAILS = "select * from accessuser where staff_id = ?";

	public static final String SEARCH_ALL_EVENT_LIST_BY_NAME = "SELECT * FROM roster_event,events WHERE  roster_event.event_id = events.event_id AND lower(event_name) like lower(?) order by lower(event_name)";

	public static final String GET_ROSTER_EVENT_LIST_BY_ID = null;

	//public static final String CHECK_START_TIME = "INSERT INTO roster_shift(start_time) VALUES (?) WHERE NOT EXISTS (SELECT start_time FROM roster_shift WHERE start_time = ?)";
	
	public static final String GET_STAFF_ROSTERS = "select * from staff_rosters, staff where staff_rosters.staff_id = staff.staff_id and income_center_id = ? and roster_date = ?";

	public static final String GET_ALLOCATED_STAFF = "select distinct staff_rosters.staff_id, staff_name from staff_rosters,staff where staff_rosters.staff_id = staff.staff_id and income_center_id = ? and roster_date = ?";

	public static final String GET_STAFF_FOR_TIPS = "select staff_name from staff,staff_rosters_services where staff.staff_id = staff_rosters_services.staff_id and roster_date = ? and service_id = ? and income_center_id = ? and eligible_for_tips = true";

	public static final String INSERT_PUBLIC_HOLIDAY = "INSERT INTO public_holiday(holiday_date, updated_by) VALUES (?, ?)";

	public static final String GET_PUBLIC_HOLIDAY = "select * from public_holiday where holiday_date = ?";

	public static final String REMOVE_PUBLIC_HOLIDAY = "DELETE FROM public_holiday WHERE holiday_date = ?";

	public static final String GET_STAFF_ROSTER = "select * from staff_rosters sr, staff s where sr.staff_id = s.staff_id and satff_roster_id = ?";

	public static final String UPDATE_ROSTER_SERVICE_TO_STAFF = "UPDATE staff_rosters_services SET  service_id=?, no_of_hours=?, updated_on=?, updated_by=? WHERE satff_roster_id = ?";
	
	public static final String GET_STAFF_ROSTER_FOR_SERVICE = "select * from staff_rosters where income_center_id = ? and roster_date = ? and staff_id = ?";

	public static final String GET_SERVICES_STAFF_ROSTER = "select * from staff_rosters_services where satff_roster_id = ?";

	public static final String REMOVE_STAFF_ROSTERS_FOR_UPDATE = "delete from staff_rosters where satff_roster_id = ?";
	
	public static final String UPDATE_INCOMECENTER_OTHER = "UPDATE income_centres SET restaurant=?, cafe=?, takeaway=?, bar=?, deli=?, retail=?, catering=?, delivery=?, event=?, room_service=?, custom1=?, custom2=?, updated_on=?, updated_by=?, slush_pct=?, fees_pct=?  WHERE income_centre_id=?";

	public static final String GET_STAFF_ROSTER_FOR_TEMPLATE = "select * from staff_rosters where roster_date = ? and income_center_id = ?";

	public static final String INSERT_ROSTER_TEMPLATE = "INSERT INTO rosters_template(template_id, staff_id, start_time, finish_time, total_hours, public_holiday, updated_by, boh_foh, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String INSERT_TEMPLATE = "INSERT INTO template_master( templatename, rosterdate, updated_by) VALUES (?, ?, ?)";

	public static final String GET_TEMPLATE_LIST = "select * from template_master";

	public static final String GET_ROSTER_FORM_TEMPLATE = "select * from rosters_template where template_id = ?";

	public static final String UPDATE_INCOMECENTER_NAME = "UPDATE income_centres SET ic_name=?,  updated_on=?, updated_by=? WHERE income_centre_id=?";

	public static final String UPDATE_DRAWER_NAME = "UPDATE cash_drawers SET till_name=?, updated_on=?, updated_by=? WHERE cash_drawer_id=?";

	public static final String UPDATE_DRAWER_DESC = "UPDATE cash_drawers SET description=?, updated_on=?, updated_by=? WHERE cash_drawer_id=?";

	public static final String UPDATE_SERVICE_NAME = "UPDATE services SET  service_name=?, updated_on=?, updated_by=? WHERE service_id=?";

	public static final String UPDATE_SERVICE_TIME = "UPDATE services SET  start_time=?, end_time=?, updated_on=?, updated_by=? WHERE service_id=?";

	public static final String GET_ROSTER_FORM_PREVEOUS_DATE = "select * from staff_rosters where roster_date = ? and income_center_id = ?";

	public static final String DELETE_BUDGET = "DELETE from budget_settings where income_ceneter_id = ? ";
	
	public static final String UPDATE_BASIC_BUDGET = "INSERT INTO budget_settings(budget_type, income_ceneter_id, turnover, food_cost_pct, bev_cost_pct, food_income, bev_income) VALUES (?, ?, ?, ?, ?, ?, ?)";

	public static final String UPDATE_SERVICE_BUDGET = "INSERT INTO budget_settings( budget_type, income_ceneter_id, service_id, turnover, food_cost_pct, bev_cost_pct, food_income, bev_income) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	
	public static final String GET_BUDGET = "Select * from budget_settings where income_ceneter_id = ? ";
	
	public static final String UPDATE_WEEKDAY_BUDGET = "INSERT INTO budget_settings( budget_type, income_ceneter_id, day_of_week, turnover, food_cost_pct, bev_cost_pct, food_income, bev_income) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String GET_BUDGET_SETTINGS = "select * from budget_settings";

	public static final String UPDATE_WEEKDAY_SERVICE_BUDGET = "INSERT INTO budget_settings(budget_type, income_ceneter_id, turnover, service_id, day_of_week, food_cost_pct, bev_cost_pct, food_income, bev_income) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String CHECK_HOLIDAY = "select * from public_holiday where holiday_date = ?";

	public static final String GET_DRAWERS = "select * from cash_drawers where income_centre_id = ?";

	public static final String GET_CREDIT_FOR_TOTAL = "select * from cashup_credit_card where cashup_credit_date = ? and income_center_id = ? and service_id = ? and credit_card_type_id in(1,2,3)";

	public static final String GET_DEBIT_FOR_TOTAL = "select * from cashup_credit_card where cashup_credit_date = ? and income_center_id = ? and service_id = ? and credit_card_type_id = 4";

	public static final String UPDATE_INCOMECENTER_ENABLE = "UPDATE income_centres SET is_enable=?, updated_on=?, updated_by=? WHERE income_centre_id=?";

	public static final String UPDATE_SHIFT_ROSTER = "update staff_rosters set start_time = ?, finish_time = ?, total_hours = ? where satff_roster_id = ?";

	public static final String REMOVE_SERVICES_STAFF_ROSTER = "delete from staff_rosters_services where satff_roster_id = ?";
}
