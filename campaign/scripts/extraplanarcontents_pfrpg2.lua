--
--	Please see the LICENSE.md file included with this distribution for attribution and copyright information.
--
-- luacheck: globals onValueChanged getValue setColor

function onInit()
	local bVisible = ExtraplanarContainers.isAnyContainer(DB.getValue(window.getDatabaseNode(), 'name'))
	window.container_bulk_label.setVisible(bVisible)
	window.capacityweight.setVisible(bVisible or window.capacityweight.getValue() ~= 0)
	window.extraplanarcontents.setVisible(bVisible or window.extraplanarcontents.getValue() ~= 0)
	onValueChanged()
end

function onValueChanged()
	if window.capacityweight.getValue() ~= 0 then
		if getValue() < window.capacityweight.getValue() then
			setColor(ColorManager.COLOR_FULL)
		elseif getValue() == window.capacityweight.getValue() then
			setColor(ColorManager.COLOR_HEALTH_HVY_WOUNDS)
		elseif getValue() > window.capacityweight.getValue() then
			setColor(ColorManager.COLOR_HEALTH_CRIT_WOUNDS)
		end
	end
end
