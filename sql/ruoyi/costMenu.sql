-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('发货成本', '3', '1', 'cost', 'biz/cost/index', 1, 0, 'C', '0', '0', 'biz:cost:list', '#', 'admin', sysdate(), '', null, '发货成本菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('发货成本查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'biz:cost:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('发货成本新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'biz:cost:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('发货成本修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'biz:cost:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('发货成本删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'biz:cost:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('发货成本导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'biz:cost:export',       '#', 'admin', sysdate(), '', null, '');