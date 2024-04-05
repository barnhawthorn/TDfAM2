classdef appTDfAM_inputUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        TDfAMAppUIFigure            matlab.ui.Figure
        SaveAsEditField             matlab.ui.control.EditField
        SaveAsEditFieldLabel        matlab.ui.control.Label
        ParametertovaryButtonGroup  matlab.ui.container.ButtonGroup
        printSpeedButton            matlab.ui.control.RadioButton
        nozTempButton               matlab.ui.control.RadioButton
        YouareeditingLabel          matlab.ui.control.Label
        appSectionNum               matlab.ui.control.Spinner
        appSectionNumLab            matlab.ui.control.Label
        ThisbuildhasXlayersLabel    matlab.ui.control.Label
        TabGroup                    matlab.ui.container.TabGroup
        VaryNozzleTemperatureTab    matlab.ui.container.Tab
        ConfirmButton               matlab.ui.control.Button
        T_NozTemp5                  matlab.ui.control.NumericEditField
        T_NozTemp5Lab               matlab.ui.control.Label
        T_LayerNum5                 matlab.ui.control.NumericEditField
        T_LayerNum5Lab              matlab.ui.control.Label
        T_NozTemp4                  matlab.ui.control.NumericEditField
        T_NozTemp4Lab               matlab.ui.control.Label
        T_LayerNum4                 matlab.ui.control.NumericEditField
        T_LayerNum4Lab              matlab.ui.control.Label
        T_NozTemp3                  matlab.ui.control.NumericEditField
        T_NozTemp3Lab               matlab.ui.control.Label
        T_LayerNum3                 matlab.ui.control.NumericEditField
        T_LayerNum3Lab              matlab.ui.control.Label
        T_NozTemp2                  matlab.ui.control.NumericEditField
        T_NozTemp2Lab               matlab.ui.control.Label
        T_LayerNum2                 matlab.ui.control.NumericEditField
        T_LayerNum2Lab              matlab.ui.control.Label
        T_NozTemp1                  matlab.ui.control.NumericEditField
        T_NozTemp1Lab               matlab.ui.control.Label
        T_LayerNum1                 matlab.ui.control.NumericEditField
        T_LayerNum1Lab              matlab.ui.control.Label
        VaryPrintSpeedTab           matlab.ui.container.Tab
        ConfirmButton_2             matlab.ui.control.Button
        S_PrintSpeed5               matlab.ui.control.NumericEditField
        S_PrintSpeed5Lab            matlab.ui.control.Label
        S_LayerNum5                 matlab.ui.control.NumericEditField
        S_LayerNum5Lab              matlab.ui.control.Label
        S_PrintSpeed4               matlab.ui.control.NumericEditField
        S_PrintSpeed4Lab            matlab.ui.control.Label
        S_LayerNum4                 matlab.ui.control.NumericEditField
        S_LayerNum4Lab              matlab.ui.control.Label
        S_PrintSpeed3               matlab.ui.control.NumericEditField
        S_PrintSpeed3Lab            matlab.ui.control.Label
        S_LayerNum3                 matlab.ui.control.NumericEditField
        S_LayerNum3Lab              matlab.ui.control.Label
        S_PrintSpeed2               matlab.ui.control.NumericEditField
        S_PrintSpeed2Lab            matlab.ui.control.Label
        S_LayerNum2                 matlab.ui.control.NumericEditField
        S_LayerNum2Lab              matlab.ui.control.Label
        S_PrintSpeed1               matlab.ui.control.NumericEditField
        S_PrintSpeed1Lab            matlab.ui.control.Label
        S_LayerNum1                 matlab.ui.control.NumericEditField
        S_LayerNum1Lab              matlab.ui.control.Label
    end

    
    properties (Access = private)
        layercount
        %filename % Description
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, layercount, filename)
            app.YouareeditingLabel.Text = ['You are editing: ', filename];
            app.ThisbuildhasXlayersLabel.Text = ['This build has: ', num2str(layercount), ' layers.'];
            name = erase(filename, ".gcode");
            app.SaveAsEditField.Value = name + "_TDfAM_Enabled";
            app.layercount = layercount;
            %app.filename = filename;
        end

        % Value changed function: appSectionNum
        function appSectionNumValueChanged(app, event)
            sectionNum = app.appSectionNum.Value;
            if sectionNum == 1
                app.S_PrintSpeed1.Enable = "on";
                app.S_PrintSpeed1Lab.Enable = "on";
                app.S_PrintSpeed2.Enable = "off";
                app.S_PrintSpeed2Lab.Enable = "off";
                app.S_LayerNum2.Enable = 'off';
                app.S_LayerNum2Lab.Enable = 'off';
                app.S_PrintSpeed3.Enable = "off";
                app.S_PrintSpeed3Lab.Enable = "off";
                app.S_LayerNum3.Enable = 'off';
                app.S_LayerNum3Lab.Enable = 'off';
                app.S_PrintSpeed4.Enable = "off";
                app.S_PrintSpeed4Lab.Enable = "off";
                app.S_LayerNum4.Enable = 'off';
                app.S_LayerNum4Lab.Enable = 'off';
                app.S_PrintSpeed5.Enable = "off";
                app.S_PrintSpeed5Lab.Enable = "off";
                app.S_LayerNum5.Enable = 'off';
                app.S_LayerNum5Lab.Enable = 'off';

                app.T_NozTemp1.Enable = "on";
                app.T_NozTemp1Lab.Enable = "on";
                app.T_NozTemp2.Enable = "off";
                app.T_NozTemp2Lab.Enable = "off";
                app.T_LayerNum2.Enable = 'off';
                app.T_LayerNum2Lab.Enable = 'off';
                app.T_NozTemp3.Enable = "off";
                app.T_NozTemp3Lab.Enable = "off";
                app.T_LayerNum3.Enable = 'off';
                app.T_LayerNum3Lab.Enable = 'off';
                app.T_NozTemp4.Enable = "off";
                app.T_NozTemp4Lab.Enable = "off";
                app.T_LayerNum4.Enable = 'off';
                app.T_LayerNum4Lab.Enable = 'off';
                app.T_NozTemp5.Enable = "off";
                app.T_NozTemp5Lab.Enable = "off";
                app.T_LayerNum5.Enable = 'off';
                app.T_LayerNum5Lab.Enable = 'off';
                if app.nozTempButton.Value
                    app.S_PrintSpeed1.Enable = "off";
                    app.S_PrintSpeed1Lab.Enable = "off";
                    app.S_PrintSpeed2.Enable = "off";
                    app.S_PrintSpeed2Lab.Enable = "off";
                    app.S_LayerNum2.Enable = 'off';
                    app.S_LayerNum2Lab.Enable = 'off';
                    app.S_PrintSpeed3.Enable = "off";
                    app.S_PrintSpeed3Lab.Enable = "off";
                    app.S_LayerNum3.Enable = 'off';
                    app.S_LayerNum3Lab.Enable = 'off';
                    app.S_PrintSpeed4.Enable = "off";
                    app.S_PrintSpeed4Lab.Enable = "off";
                    app.S_LayerNum4.Enable = 'off';
                    app.S_LayerNum4Lab.Enable = 'off';
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                else
                    app.T_NozTemp1.Enable = "off";
                    app.T_NozTemp1Lab.Enable = "off";
                    app.T_NozTemp2.Enable = "off";
                    app.T_NozTemp2Lab.Enable = "off";
                    app.T_LayerNum2.Enable = 'off';
                    app.T_LayerNum2Lab.Enable = 'off';
                    app.T_NozTemp3.Enable = "off";
                    app.T_NozTemp3Lab.Enable = "off";
                    app.T_LayerNum3.Enable = 'off';
                    app.T_LayerNum3Lab.Enable = 'off';
                    app.T_NozTemp4.Enable = "off";
                    app.T_NozTemp4Lab.Enable = "off";
                    app.T_LayerNum4.Enable = 'off';
                    app.T_LayerNum4Lab.Enable = 'off';
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                end

            elseif sectionNum == 2
                app.S_PrintSpeed1.Enable = "on";
                app.S_PrintSpeed1Lab.Enable = "on";
                app.S_PrintSpeed2.Enable = "on";
                app.S_PrintSpeed2Lab.Enable = "on";
                app.S_LayerNum2.Enable = 'on';
                app.S_LayerNum2Lab.Enable = 'on';
                app.S_PrintSpeed3.Enable = "off";
                app.S_PrintSpeed3Lab.Enable = "off";
                app.S_LayerNum3.Enable = 'off';
                app.S_LayerNum3Lab.Enable = 'off';
                app.S_PrintSpeed4.Enable = "off";
                app.S_PrintSpeed4Lab.Enable = "off";
                app.S_LayerNum4.Enable = 'off';
                app.S_LayerNum4Lab.Enable = 'off';
                app.S_PrintSpeed5.Enable = "off";
                app.S_PrintSpeed5Lab.Enable = "off";
                app.S_LayerNum5.Enable = 'off';
                app.S_LayerNum5Lab.Enable = 'off';

                app.T_NozTemp1.Enable = "on";
                app.T_NozTemp1Lab.Enable = "on";
                app.T_NozTemp2.Enable = "on";
                app.T_NozTemp2Lab.Enable = "on";
                app.T_LayerNum2.Enable = 'on';
                app.T_LayerNum2Lab.Enable = 'on';
                app.T_NozTemp3.Enable = "off";
                app.T_NozTemp3Lab.Enable = "off";
                app.T_LayerNum3.Enable = 'off';
                app.T_LayerNum3Lab.Enable = 'off';
                app.T_NozTemp4.Enable = "off";
                app.T_NozTemp4Lab.Enable = "off";
                app.T_LayerNum4.Enable = 'off';
                app.T_LayerNum4Lab.Enable = 'off';
                app.T_NozTemp5.Enable = "off";
                app.T_NozTemp5Lab.Enable = "off";
                app.T_LayerNum5.Enable = 'off';
                app.T_LayerNum5Lab.Enable = 'off';

                if app.nozTempButton.Value
                    app.S_PrintSpeed1.Enable = "off";
                    app.S_PrintSpeed1Lab.Enable = "off";
                    app.S_PrintSpeed2.Enable = "off";
                    app.S_PrintSpeed2Lab.Enable = "off";
                    app.S_LayerNum2.Enable = 'off';
                    app.S_LayerNum2Lab.Enable = 'off';
                    app.S_PrintSpeed3.Enable = "off";
                    app.S_PrintSpeed3Lab.Enable = "off";
                    app.S_LayerNum3.Enable = 'off';
                    app.S_LayerNum3Lab.Enable = 'off';
                    app.S_PrintSpeed4.Enable = "off";
                    app.S_PrintSpeed4Lab.Enable = "off";
                    app.S_LayerNum4.Enable = 'off';
                    app.S_LayerNum4Lab.Enable = 'off';
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                else
                    app.T_NozTemp1.Enable = "off";
                    app.T_NozTemp1Lab.Enable = "off";
                    app.T_NozTemp2.Enable = "off";
                    app.T_NozTemp2Lab.Enable = "off";
                    app.T_LayerNum2.Enable = 'off';
                    app.T_LayerNum2Lab.Enable = 'off';
                    app.T_NozTemp3.Enable = "off";
                    app.T_NozTemp3Lab.Enable = "off";
                    app.T_LayerNum3.Enable = 'off';
                    app.T_LayerNum3Lab.Enable = 'off';
                    app.T_NozTemp4.Enable = "off";
                    app.T_NozTemp4Lab.Enable = "off";
                    app.T_LayerNum4.Enable = 'off';
                    app.T_LayerNum4Lab.Enable = 'off';
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                end

            elseif sectionNum == 3
                app.S_PrintSpeed1.Enable = "on";
                app.S_PrintSpeed1Lab.Enable = "on";
                app.S_PrintSpeed2.Enable = "on";
                app.S_PrintSpeed2Lab.Enable = "on";
                app.S_LayerNum2.Enable = 'on';
                app.S_LayerNum2Lab.Enable = 'on';
                app.S_PrintSpeed3.Enable = "on";
                app.S_PrintSpeed3Lab.Enable = "on";
                app.S_LayerNum3.Enable = 'on';
                app.S_LayerNum3Lab.Enable = 'on';
                app.S_PrintSpeed4.Enable = "off";
                app.S_PrintSpeed4Lab.Enable = "off";
                app.S_LayerNum4.Enable = 'off';
                app.S_LayerNum4Lab.Enable = 'off';
                app.S_PrintSpeed5.Enable = "off";
                app.S_PrintSpeed5Lab.Enable = "off";
                app.S_LayerNum5.Enable = 'off';
                app.S_LayerNum5Lab.Enable = 'off';

                app.T_NozTemp1.Enable = "on";
                app.T_NozTemp1Lab.Enable = "on";
                app.T_NozTemp2.Enable = "on";
                app.T_NozTemp2Lab.Enable = "on";
                app.T_LayerNum2.Enable = 'on';
                app.T_LayerNum2Lab.Enable = 'on';
                app.T_NozTemp3.Enable = "on";
                app.T_NozTemp3Lab.Enable = "on";
                app.T_LayerNum3.Enable = 'on';
                app.T_LayerNum3Lab.Enable = 'on';
                app.T_NozTemp4.Enable = "off";
                app.T_NozTemp4Lab.Enable = "off";
                app.T_LayerNum4.Enable = 'off';
                app.T_LayerNum4Lab.Enable = 'off';
                app.T_NozTemp5.Enable = "off";
                app.T_NozTemp5Lab.Enable = "off";
                app.T_LayerNum5.Enable = 'off';
                app.T_LayerNum5Lab.Enable = 'off';

                if app.nozTempButton.Value
                    app.S_PrintSpeed1.Enable = "off";
                    app.S_PrintSpeed1Lab.Enable = "off";
                    app.S_PrintSpeed2.Enable = "off";
                    app.S_PrintSpeed2Lab.Enable = "off";
                    app.S_LayerNum2.Enable = 'off';
                    app.S_LayerNum2Lab.Enable = 'off';
                    app.S_PrintSpeed3.Enable = "off";
                    app.S_PrintSpeed3Lab.Enable = "off";
                    app.S_LayerNum3.Enable = 'off';
                    app.S_LayerNum3Lab.Enable = 'off';
                    app.S_PrintSpeed4.Enable = "off";
                    app.S_PrintSpeed4Lab.Enable = "off";
                    app.S_LayerNum4.Enable = 'off';
                    app.S_LayerNum4Lab.Enable = 'off';
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                else
                    app.T_NozTemp1.Enable = "off";
                    app.T_NozTemp1Lab.Enable = "off";
                    app.T_NozTemp2.Enable = "off";
                    app.T_NozTemp2Lab.Enable = "off";
                    app.T_LayerNum2.Enable = 'off';
                    app.T_LayerNum2Lab.Enable = 'off';
                    app.T_NozTemp3.Enable = "off";
                    app.T_NozTemp3Lab.Enable = "off";
                    app.T_LayerNum3.Enable = 'off';
                    app.T_LayerNum3Lab.Enable = 'off';
                    app.T_NozTemp4.Enable = "off";
                    app.T_NozTemp4Lab.Enable = "off";
                    app.T_LayerNum4.Enable = 'off';
                    app.T_LayerNum4Lab.Enable = 'off';
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                end

            elseif sectionNum == 4
                app.S_PrintSpeed1.Enable = "on";
                app.S_PrintSpeed1Lab.Enable = "on";
                app.S_PrintSpeed2.Enable = "on";
                app.S_PrintSpeed2Lab.Enable = "on";
                app.S_LayerNum2.Enable = 'on';
                app.S_LayerNum2Lab.Enable = 'on';
                app.S_PrintSpeed3.Enable = "on";
                app.S_PrintSpeed3Lab.Enable = "on";
                app.S_LayerNum3.Enable = 'on';
                app.S_LayerNum3Lab.Enable = 'on';
                app.S_PrintSpeed4.Enable = "on";
                app.S_PrintSpeed4Lab.Enable = "on";
                app.S_LayerNum4.Enable = 'on';
                app.S_LayerNum4Lab.Enable = 'on';
                app.S_PrintSpeed5.Enable = "off";
                app.S_PrintSpeed5Lab.Enable = "off";
                app.S_LayerNum5.Enable = 'off';
                app.S_LayerNum5Lab.Enable = 'off';

                app.T_NozTemp1.Enable = "on";
                app.T_NozTemp1Lab.Enable = "on";
                app.T_NozTemp2.Enable = "on";
                app.T_NozTemp2Lab.Enable = "on";
                app.T_LayerNum2.Enable = 'on';
                app.T_LayerNum2Lab.Enable = 'on';
                app.T_NozTemp3.Enable = "on";
                app.T_NozTemp3Lab.Enable = "on";
                app.T_LayerNum3.Enable = 'on';
                app.T_LayerNum3Lab.Enable = 'on';
                app.T_NozTemp4.Enable = "on";
                app.T_NozTemp4Lab.Enable = "on";
                app.T_LayerNum4.Enable = 'on';
                app.T_LayerNum4Lab.Enable = 'on';
                app.T_NozTemp5.Enable = "off";
                app.T_NozTemp5Lab.Enable = "off";
                app.T_LayerNum5.Enable = 'off';
                app.T_LayerNum5Lab.Enable = 'off';

                if app.nozTempButton.Value
                    app.S_PrintSpeed1.Enable = "off";
                    app.S_PrintSpeed1Lab.Enable = "off";
                    app.S_PrintSpeed2.Enable = "off";
                    app.S_PrintSpeed2Lab.Enable = "off";
                    app.S_LayerNum2.Enable = 'off';
                    app.S_LayerNum2Lab.Enable = 'off';
                    app.S_PrintSpeed3.Enable = "off";
                    app.S_PrintSpeed3Lab.Enable = "off";
                    app.S_LayerNum3.Enable = 'off';
                    app.S_LayerNum3Lab.Enable = 'off';
                    app.S_PrintSpeed4.Enable = "off";
                    app.S_PrintSpeed4Lab.Enable = "off";
                    app.S_LayerNum4.Enable = 'off';
                    app.S_LayerNum4Lab.Enable = 'off';
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                else
                    app.T_NozTemp1.Enable = "off";
                    app.T_NozTemp1Lab.Enable = "off";
                    app.T_NozTemp2.Enable = "off";
                    app.T_NozTemp2Lab.Enable = "off";
                    app.T_LayerNum2.Enable = 'off';
                    app.T_LayerNum2Lab.Enable = 'off';
                    app.T_NozTemp3.Enable = "off";
                    app.T_NozTemp3Lab.Enable = "off";
                    app.T_LayerNum3.Enable = 'off';
                    app.T_LayerNum3Lab.Enable = 'off';
                    app.T_NozTemp4.Enable = "off";
                    app.T_NozTemp4Lab.Enable = "off";
                    app.T_LayerNum4.Enable = 'off';
                    app.T_LayerNum4Lab.Enable = 'off';
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                end

            elseif sectionNum == 5
                app.S_PrintSpeed1.Enable = "on";
                app.S_PrintSpeed1Lab.Enable = "on";
                app.S_PrintSpeed2.Enable = "on";
                app.S_PrintSpeed2Lab.Enable = "on";
                app.S_LayerNum2.Enable = 'on';
                app.S_LayerNum2Lab.Enable = 'on';
                app.S_PrintSpeed3.Enable = "on";
                app.S_PrintSpeed3Lab.Enable = "on";
                app.S_LayerNum3.Enable = 'on';
                app.S_LayerNum3Lab.Enable = 'on';
                app.S_PrintSpeed4.Enable = "on";
                app.S_PrintSpeed4Lab.Enable = "on";
                app.S_LayerNum4.Enable = 'on';
                app.S_LayerNum4Lab.Enable = 'on';
                app.S_PrintSpeed5.Enable = "on";
                app.S_PrintSpeed5Lab.Enable = "on";
                app.S_LayerNum5.Enable = 'on';
                app.S_LayerNum5Lab.Enable = 'on';

                app.T_NozTemp1.Enable = "on";
                app.T_NozTemp1Lab.Enable = "on";
                app.T_NozTemp2.Enable = "on";
                app.T_NozTemp2Lab.Enable = "on";
                app.T_LayerNum2.Enable = 'on';
                app.T_LayerNum2Lab.Enable = 'on';
                app.T_NozTemp3.Enable = "on";
                app.T_NozTemp3Lab.Enable = "on";
                app.T_LayerNum3.Enable = 'on';
                app.T_LayerNum3Lab.Enable = 'on';
                app.T_NozTemp4.Enable = "on";
                app.T_NozTemp4Lab.Enable = "on";
                app.T_LayerNum4.Enable = 'on';
                app.T_LayerNum4Lab.Enable = 'on';
                app.T_NozTemp5.Enable = "on";
                app.T_NozTemp5Lab.Enable = "on";
                app.T_LayerNum5.Enable = 'on';
                app.T_LayerNum5Lab.Enable = 'on';

                if app.nozTempButton.Value
                    app.S_PrintSpeed1.Enable = "off";
                    app.S_PrintSpeed1Lab.Enable = "off";
                    app.S_PrintSpeed2.Enable = "off";
                    app.S_PrintSpeed2Lab.Enable = "off";
                    app.S_LayerNum2.Enable = 'off';
                    app.S_LayerNum2Lab.Enable = 'off';
                    app.S_PrintSpeed3.Enable = "off";
                    app.S_PrintSpeed3Lab.Enable = "off";
                    app.S_LayerNum3.Enable = 'off';
                    app.S_LayerNum3Lab.Enable = 'off';
                    app.S_PrintSpeed4.Enable = "off";
                    app.S_PrintSpeed4Lab.Enable = "off";
                    app.S_LayerNum4.Enable = 'off';
                    app.S_LayerNum4Lab.Enable = 'off';
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                else
                    app.T_NozTemp1.Enable = "off";
                    app.T_NozTemp1Lab.Enable = "off";
                    app.T_NozTemp2.Enable = "off";
                    app.T_NozTemp2Lab.Enable = "off";
                    app.T_LayerNum2.Enable = 'off';
                    app.T_LayerNum2Lab.Enable = 'off';
                    app.T_NozTemp3.Enable = "off";
                    app.T_NozTemp3Lab.Enable = "off";
                    app.T_LayerNum3.Enable = 'off';
                    app.T_LayerNum3Lab.Enable = 'off';
                    app.T_NozTemp4.Enable = "off";
                    app.T_NozTemp4Lab.Enable = "off";
                    app.T_LayerNum4.Enable = 'off';
                    app.T_LayerNum4Lab.Enable = 'off';
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                end
            end
        end

        % Value changed function: T_LayerNum2
        function T_LayerNum2ValueChanged(app, event)
            layerNumSec2 = app.T_LayerNum2.Value;

            app.T_LayerNum2.Limits = [1 app.layercount];

            minLayerSec3 = app.T_LayerNum2.Value + 1;
            app.T_LayerNum3.Limits = [minLayerSec3 app.layercount];

            minLayerSec4 = app.T_LayerNum3.Value + 1;
            app.T_LayerNum4.Limits = [minLayerSec4 app.layercount];

            minLayerSec5 = app.T_LayerNum4.Value + 1;
            app.T_LayerNum5.Limits = [minLayerSec5 app.layercount];
        end

        % Value changed function: T_LayerNum3
        function T_LayerNum3ValueChanged(app, event)
            layerNumSec3 = app.T_LayerNum3.Value;

            app.T_LayerNum2.Limits = [1 app.layercount];

            minLayerSec3 = app.T_LayerNum2.Value + 1;
            app.T_LayerNum3.Limits = [minLayerSec3 app.layercount];

            minLayerSec4 = app.T_LayerNum3.Value + 1;
            app.T_LayerNum4.Limits = [minLayerSec4 app.layercount];

            minLayerSec5 = app.T_LayerNum4.Value + 1;
            app.T_LayerNum5.Limits = [minLayerSec5 app.layercount];
        end

        % Value changed function: T_LayerNum4
        function T_LayerNum4ValueChanged(app, event)
            layerNumSec4 = app.T_LayerNum4.Value;

            app.T_LayerNum2.Limits = [1 app.layercount];

            minLayerSec3 = app.T_LayerNum2.Value + 1;
            app.T_LayerNum3.Limits = [minLayerSec3 app.layercount];

            minLayerSec4 = app.T_LayerNum3.Value + 1;
            app.T_LayerNum4.Limits = [minLayerSec4 app.layercount];

            minLayerSec5 = app.T_LayerNum4.Value + 1;
            app.T_LayerNum5.Limits = [minLayerSec5 app.layercount];
        end

        % Value changed function: T_LayerNum5
        function T_LayerNum5ValueChanged(app, event)
            layerNumSec5 = app.T_LayerNum5.Value;

            app.T_LayerNum2.Limits = [1 app.layercount];

            minLayerSec3 = app.T_LayerNum2.Value + 1;
            app.T_LayerNum3.Limits = [minLayerSec3 app.layercount];

            minLayerSec4 = app.T_LayerNum3.Value + 1;
            app.T_LayerNum4.Limits = [minLayerSec4 app.layercount];

            minLayerSec5 = app.T_LayerNum4.Value + 1;
            app.T_LayerNum5.Limits = [minLayerSec5 app.layercount];
        end

        % Button pushed function: ConfirmButton
        function ConfirmButtonPushed(app, event)
            if app.nozTempButton.Value

                assignin('base', 'layerNumSec2', app.T_LayerNum2.Value)
                assignin('base', 'layerNumSec3', app.T_LayerNum3.Value)
                assignin('base', 'layerNumSec4', app.T_LayerNum4.Value)
                assignin('base', 'layerNumSec5', app.T_LayerNum5.Value)
                assignin('base', 'nozTemp1', app.T_NozTemp1.Value)
                assignin('base', 'nozTemp2', app.T_NozTemp2.Value)
                assignin('base', 'nozTemp3', app.T_NozTemp3.Value)
                assignin('base', 'nozTemp4', app.T_NozTemp4.Value)
                assignin('base', 'nozTemp5', app.T_NozTemp5.Value)
            else
                assignin('base', 'layerNumSec2', app.S_LayerNum2.Value)
                assignin('base', 'layerNumSec3', app.S_LayerNum3.Value)
                assignin('base', 'layerNumSec4', app.S_LayerNum4.Value)
                assignin('base', 'layerNumSec5', app.S_LayerNum5.Value)
                assignin('base', 'printSpeed1', app.S_PrintSpeed1.Value)
                assignin('base', 'printSpeed2', app.S_PrintSpeed2.Value)
                assignin('base', 'printSpeed3', app.S_PrintSpeed3.Value)
                assignin('base', 'printSpeed4', app.S_PrintSpeed4.Value)
                assignin('base', 'printSpeed5', app.S_PrintSpeed5.Value)
            end
            assignin('base','secNum',app.appSectionNum.Value)
            assignin('base','tf1',app.printSpeedButton.Value)
            assignin('base','TF4',app.nozTempButton.Value)
            assignin('base','newFileName',app.SaveAsEditField.Value)
            
            app.delete
        end

        % Selection changed function: ParametertovaryButtonGroup
        function nozOrSpeedButtonChange(app, event)
            sectionNum = app.appSectionNum.Value;
            if app.nozTempButton.Value
                app.S_PrintSpeed1.Enable = "off";
                app.S_PrintSpeed1Lab.Enable = "off";
                app.S_PrintSpeed2.Enable = "off";
                app.S_PrintSpeed2Lab.Enable = "off";
                app.S_LayerNum2.Enable = 'off';
                app.S_LayerNum2Lab.Enable = 'off';
                app.S_PrintSpeed3.Enable = "off";
                app.S_PrintSpeed3Lab.Enable = "off";
                app.S_LayerNum3.Enable = 'off';
                app.S_LayerNum3Lab.Enable = 'off';
                app.S_PrintSpeed4.Enable = "off";
                app.S_PrintSpeed4Lab.Enable = "off";
                app.S_LayerNum4.Enable = 'off';
                app.S_LayerNum4Lab.Enable = 'off';
                app.S_PrintSpeed5.Enable = "off";
                app.S_PrintSpeed5Lab.Enable = "off";
                app.S_LayerNum5.Enable = 'off';
                app.S_LayerNum5Lab.Enable = 'off';
                
                app.T_NozTemp1.Enable = "on";
                app.T_NozTemp1Lab.Enable = "on";
                app.T_NozTemp2.Enable = "on";
                app.T_NozTemp2Lab.Enable = "on";
                app.T_LayerNum2.Enable = 'on';
                app.T_LayerNum2Lab.Enable = 'on';
                app.T_NozTemp3.Enable = "on";
                app.T_NozTemp3Lab.Enable = "on";
                app.T_LayerNum3.Enable = 'on';
                app.T_LayerNum3Lab.Enable = 'on';
                app.T_NozTemp4.Enable = "on";
                app.T_NozTemp4Lab.Enable = "on";
                app.T_LayerNum4.Enable = 'on';
                app.T_LayerNum4Lab.Enable = 'on';
                app.T_NozTemp5.Enable = "on";
                app.T_NozTemp5Lab.Enable = "on";
                app.T_LayerNum5.Enable = 'on';
                app.T_LayerNum5Lab.Enable = 'on';
                if sectionNum == 1
                    app.T_NozTemp2.Enable = "off";
                    app.T_NozTemp2Lab.Enable = "off";
                    app.T_LayerNum2.Enable = 'off';
                    app.T_LayerNum2Lab.Enable = 'off';
                    app.T_NozTemp3.Enable = "off";
                    app.T_NozTemp3Lab.Enable = "off";
                    app.T_LayerNum3.Enable = 'off';
                    app.T_LayerNum3Lab.Enable = 'off';
                    app.T_NozTemp4.Enable = "off";
                    app.T_NozTemp4Lab.Enable = "off";
                    app.T_LayerNum4.Enable = 'off';
                    app.T_LayerNum4Lab.Enable = 'off';
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                elseif sectionNum == 2
                    app.T_NozTemp3.Enable = "off";
                    app.T_NozTemp3Lab.Enable = "off";
                    app.T_LayerNum3.Enable = 'off';
                    app.T_LayerNum3Lab.Enable = 'off';
                    app.T_NozTemp4.Enable = "off";
                    app.T_NozTemp4Lab.Enable = "off";
                    app.T_LayerNum4.Enable = 'off';
                    app.T_LayerNum4Lab.Enable = 'off';
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                elseif sectionNum == 3
                    app.T_NozTemp4.Enable = "off";
                    app.T_NozTemp4Lab.Enable = "off";
                    app.T_LayerNum4.Enable = 'off';
                    app.T_LayerNum4Lab.Enable = 'off';
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                elseif sectionNum == 4
                    app.T_NozTemp5.Enable = "off";
                    app.T_NozTemp5Lab.Enable = "off";
                    app.T_LayerNum5.Enable = 'off';
                    app.T_LayerNum5Lab.Enable = 'off';
                elseif sectionNum == 5
                    
                end


            else
                app.S_PrintSpeed1.Enable = "on";
                app.S_PrintSpeed1Lab.Enable = "on";
                app.S_PrintSpeed2.Enable = "on";
                app.S_PrintSpeed2Lab.Enable = "on";
                app.S_LayerNum2.Enable = 'on';
                app.S_LayerNum2Lab.Enable = 'on';
                app.S_PrintSpeed3.Enable = "on";
                app.S_PrintSpeed3Lab.Enable = "on";
                app.S_LayerNum3.Enable = 'on';
                app.S_LayerNum3Lab.Enable = 'on';
                app.S_PrintSpeed4.Enable = "on";
                app.S_PrintSpeed4Lab.Enable = "on";
                app.S_LayerNum4.Enable = 'on';
                app.S_LayerNum4Lab.Enable = 'on';
                app.S_PrintSpeed5.Enable = "on";
                app.S_PrintSpeed5Lab.Enable = "on";
                app.S_LayerNum5.Enable = 'on';
                app.S_LayerNum5Lab.Enable = 'on';
                
                app.T_NozTemp1.Enable = "off";
                app.T_NozTemp1Lab.Enable = "off";
                app.T_NozTemp2.Enable = "off";
                app.T_NozTemp2Lab.Enable = "off";
                app.T_LayerNum2.Enable = 'off';
                app.T_LayerNum2Lab.Enable = 'off';
                app.T_NozTemp3.Enable = "off";
                app.T_NozTemp3Lab.Enable = "off";
                app.T_LayerNum3.Enable = 'off';
                app.T_LayerNum3Lab.Enable = 'off';
                app.T_NozTemp4.Enable = "off";
                app.T_NozTemp4Lab.Enable = "off";
                app.T_LayerNum4.Enable = 'off';
                app.T_LayerNum4Lab.Enable = 'off';
                app.T_NozTemp5.Enable = "off";
                app.T_NozTemp5Lab.Enable = "off";
                app.T_LayerNum5.Enable = 'off';
                app.T_LayerNum5Lab.Enable = 'off';
                if sectionNum == 1
                    app.S_PrintSpeed2.Enable = "off";
                    app.S_PrintSpeed2Lab.Enable = "off";
                    app.S_LayerNum2.Enable = 'off';
                    app.S_LayerNum2Lab.Enable = 'off';
                    app.S_PrintSpeed3.Enable = "off";
                    app.S_PrintSpeed3Lab.Enable = "off";
                    app.S_LayerNum3.Enable = 'off';
                    app.S_LayerNum3Lab.Enable = 'off';
                    app.S_PrintSpeed4.Enable = "off";
                    app.S_PrintSpeed4Lab.Enable = "off";
                    app.S_LayerNum4.Enable = 'off';
                    app.S_LayerNum4Lab.Enable = 'off';
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                elseif sectionNum == 2
                    app.S_PrintSpeed3.Enable = "off";
                    app.S_PrintSpeed3Lab.Enable = "off";
                    app.S_LayerNum3.Enable = 'off';
                    app.S_LayerNum3Lab.Enable = 'off';
                    app.S_PrintSpeed4.Enable = "off";
                    app.S_PrintSpeed4Lab.Enable = "off";
                    app.S_LayerNum4.Enable = 'off';
                    app.S_LayerNum4Lab.Enable = 'off';
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                elseif sectionNum == 3
                    app.S_PrintSpeed4.Enable = "off";
                    app.S_PrintSpeed4Lab.Enable = "off";
                    app.S_LayerNum4.Enable = 'off';
                    app.S_LayerNum4Lab.Enable = 'off';
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                elseif sectionNum == 4
                    app.S_PrintSpeed5.Enable = "off";
                    app.S_PrintSpeed5Lab.Enable = "off";
                    app.S_LayerNum5.Enable = 'off';
                    app.S_LayerNum5Lab.Enable = 'off';
                elseif sectionNum == 5
                    
                end
            end

        end

        % Button pushed function: ConfirmButton_2
        function ConfirmButton_2Pushed(app, event)
            if app.nozTempButton.Value
                assignin('base', 'layerNumSec2', app.T_LayerNum2.Value)
                assignin('base', 'layerNumSec3', app.T_LayerNum3.Value)
                assignin('base', 'layerNumSec4', app.T_LayerNum4.Value)
                assignin('base', 'layerNumSec5', app.T_LayerNum5.Value)
                assignin('base', 'nozTemp1', app.T_NozTemp1.Value)
                assignin('base', 'nozTemp2', app.T_NozTemp2.Value)
                assignin('base', 'nozTemp3', app.T_NozTemp3.Value)
                assignin('base', 'nozTemp4', app.T_NozTemp4.Value)
                assignin('base', 'nozTemp5', app.T_NozTemp5.Value)
            else
                assignin('base', 'layerNumSec2', app.S_LayerNum2.Value)
                assignin('base', 'layerNumSec3', app.S_LayerNum3.Value)
                assignin('base', 'layerNumSec4', app.S_LayerNum4.Value)
                assignin('base', 'layerNumSec5', app.S_LayerNum5.Value)
                assignin('base', 'printSpeed1', app.S_PrintSpeed1.Value)
                assignin('base', 'printSpeed2', app.S_PrintSpeed2.Value)
                assignin('base', 'printSpeed3', app.S_PrintSpeed3.Value)
                assignin('base', 'printSpeed4', app.S_PrintSpeed4.Value)
                assignin('base', 'printSpeed5', app.S_PrintSpeed5.Value)
            end
            assignin('base','secNum',app.appSectionNum.Value)
            assignin('base','tf1',app.printSpeedButton.Value)
            assignin('base','TF4',app.nozTempButton.Value)
            assignin('base','newFileName',app.SaveAsEditField.Value)

            app.delete
        end

        % Value changed function: S_LayerNum2
        function S_LayerNum2ValueChanged(app, event)
            layerNumSec2 = app.S_LayerNum2.Value;

            app.S_LayerNum2.Limits = [1 app.layercount];

            minLayerSec3 = app.S_LayerNum2.Value + 1;
            app.S_LayerNum3.Limits = [minLayerSec3 app.layercount];

            minLayerSec4 = app.S_LayerNum3.Value + 1;
            app.S_LayerNum4.Limits = [minLayerSec4 app.layercount];

            minLayerSec5 = app.S_LayerNum4.Value + 1;
            app.S_LayerNum5.Limits = [minLayerSec5 app.layercount];
        end

        % Value changed function: S_LayerNum3
        function S_LayerNum3ValueChanged(app, event)
            layerNumSec3 = app.S_LayerNum3.Value;

            app.S_LayerNum2.Limits = [1 app.layercount];

            minLayerSec3 = app.S_LayerNum2.Value + 1;
            app.S_LayerNum3.Limits = [minLayerSec3 app.layercount];

            minLayerSec4 = app.S_LayerNum3.Value + 1;
            app.S_LayerNum4.Limits = [minLayerSec4 app.layercount];

            minLayerSec5 = app.S_LayerNum4.Value + 1;
            app.S_LayerNum5.Limits = [minLayerSec5 app.layercount];
        end

        % Value changed function: S_LayerNum4
        function S_LayerNum4ValueChanged(app, event)
            layerNumSec4 = app.S_LayerNum4.Value;

            app.S_LayerNum2.Limits = [1 app.layercount];

            minLayerSec3 = app.S_LayerNum2.Value + 1;
            app.S_LayerNum3.Limits = [minLayerSec3 app.layercount];

            minLayerSec4 = app.S_LayerNum3.Value + 1;
            app.S_LayerNum4.Limits = [minLayerSec4 app.layercount];

            minLayerSec5 = app.S_LayerNum4.Value + 1;
            app.S_LayerNum5.Limits = [minLayerSec5 app.layercount];
        end

        % Value changed function: S_LayerNum5
        function S_LayerNum5ValueChanged(app, event)
            layerNumSec5 = app.S_LayerNum5.Value;

            app.S_LayerNum2.Limits = [1 app.layercount];

            minLayerSec3 = app.S_LayerNum2.Value + 1;
            app.S_LayerNum3.Limits = [minLayerSec3 app.layercount];

            minLayerSec4 = app.S_LayerNum3.Value + 1;
            app.S_LayerNum4.Limits = [minLayerSec4 app.layercount];

            minLayerSec5 = app.S_LayerNum4.Value + 1;
            app.S_LayerNum5.Limits = [minLayerSec5 app.layercount];
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create TDfAMAppUIFigure and hide until all components are created
            app.TDfAMAppUIFigure = uifigure('Visible', 'off');
            app.TDfAMAppUIFigure.Position = [100 100 640 528];
            app.TDfAMAppUIFigure.Name = 'TDfAM App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.TDfAMAppUIFigure);
            app.TabGroup.Position = [1 2 640 396];

            % Create VaryNozzleTemperatureTab
            app.VaryNozzleTemperatureTab = uitab(app.TabGroup);
            app.VaryNozzleTemperatureTab.Title = 'Vary Nozzle Temperature';

            % Create T_LayerNum1Lab
            app.T_LayerNum1Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_LayerNum1Lab.HorizontalAlignment = 'right';
            app.T_LayerNum1Lab.Position = [223 330 83 22];
            app.T_LayerNum1Lab.Text = 'Layer number:';

            % Create T_LayerNum1
            app.T_LayerNum1 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_LayerNum1.Limits = [0 1];
            app.T_LayerNum1.Editable = 'off';
            app.T_LayerNum1.Position = [321 330 100 22];

            % Create T_NozTemp1Lab
            app.T_NozTemp1Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_NozTemp1Lab.HorizontalAlignment = 'right';
            app.T_NozTemp1Lab.Position = [163 302 143 22];
            app.T_NozTemp1Lab.Text = 'Initial nozzle temperature:';

            % Create T_NozTemp1
            app.T_NozTemp1 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_NozTemp1.Limits = [0 230];
            app.T_NozTemp1.Position = [321 302 100 22];
            app.T_NozTemp1.Value = 200;

            % Create T_LayerNum2Lab
            app.T_LayerNum2Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_LayerNum2Lab.HorizontalAlignment = 'right';
            app.T_LayerNum2Lab.Enable = 'off';
            app.T_LayerNum2Lab.Position = [223 259 83 22];
            app.T_LayerNum2Lab.Text = 'Layer number:';

            % Create T_LayerNum2
            app.T_LayerNum2 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_LayerNum2.Limits = [1 Inf];
            app.T_LayerNum2.ValueChangedFcn = createCallbackFcn(app, @T_LayerNum2ValueChanged, true);
            app.T_LayerNum2.Enable = 'off';
            app.T_LayerNum2.Position = [321 259 100 22];
            app.T_LayerNum2.Value = 1;

            % Create T_NozTemp2Lab
            app.T_NozTemp2Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_NozTemp2Lab.HorizontalAlignment = 'right';
            app.T_NozTemp2Lab.Enable = 'off';
            app.T_NozTemp2Lab.Position = [182 230 124 22];
            app.T_NozTemp2Lab.Text = 'Nozzle temperature 2:';

            % Create T_NozTemp2
            app.T_NozTemp2 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_NozTemp2.Limits = [0 230];
            app.T_NozTemp2.Enable = 'off';
            app.T_NozTemp2.Position = [321 230 100 22];

            % Create T_LayerNum3Lab
            app.T_LayerNum3Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_LayerNum3Lab.HorizontalAlignment = 'right';
            app.T_LayerNum3Lab.Enable = 'off';
            app.T_LayerNum3Lab.Position = [223 189 83 22];
            app.T_LayerNum3Lab.Text = 'Layer number:';

            % Create T_LayerNum3
            app.T_LayerNum3 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_LayerNum3.Limits = [0 Inf];
            app.T_LayerNum3.ValueChangedFcn = createCallbackFcn(app, @T_LayerNum3ValueChanged, true);
            app.T_LayerNum3.Enable = 'off';
            app.T_LayerNum3.Position = [321 189 100 22];
            app.T_LayerNum3.Value = 2;

            % Create T_NozTemp3Lab
            app.T_NozTemp3Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_NozTemp3Lab.HorizontalAlignment = 'right';
            app.T_NozTemp3Lab.Enable = 'off';
            app.T_NozTemp3Lab.Position = [182 159 124 22];
            app.T_NozTemp3Lab.Text = 'Nozzle temperature 3:';

            % Create T_NozTemp3
            app.T_NozTemp3 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_NozTemp3.Limits = [0 230];
            app.T_NozTemp3.Enable = 'off';
            app.T_NozTemp3.Position = [321 159 100 22];

            % Create T_LayerNum4Lab
            app.T_LayerNum4Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_LayerNum4Lab.HorizontalAlignment = 'right';
            app.T_LayerNum4Lab.Enable = 'off';
            app.T_LayerNum4Lab.Position = [223 120 83 22];
            app.T_LayerNum4Lab.Text = 'Layer number:';

            % Create T_LayerNum4
            app.T_LayerNum4 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_LayerNum4.Limits = [0 Inf];
            app.T_LayerNum4.ValueChangedFcn = createCallbackFcn(app, @T_LayerNum4ValueChanged, true);
            app.T_LayerNum4.Enable = 'off';
            app.T_LayerNum4.Position = [321 120 100 22];
            app.T_LayerNum4.Value = 3;

            % Create T_NozTemp4Lab
            app.T_NozTemp4Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_NozTemp4Lab.HorizontalAlignment = 'right';
            app.T_NozTemp4Lab.Enable = 'off';
            app.T_NozTemp4Lab.Position = [182 91 124 22];
            app.T_NozTemp4Lab.Text = 'Nozzle temperature 4:';

            % Create T_NozTemp4
            app.T_NozTemp4 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_NozTemp4.Limits = [0 230];
            app.T_NozTemp4.Enable = 'off';
            app.T_NozTemp4.Position = [321 91 100 22];

            % Create T_LayerNum5Lab
            app.T_LayerNum5Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_LayerNum5Lab.HorizontalAlignment = 'right';
            app.T_LayerNum5Lab.Enable = 'off';
            app.T_LayerNum5Lab.Position = [223 52 83 22];
            app.T_LayerNum5Lab.Text = 'Layer number:';

            % Create T_LayerNum5
            app.T_LayerNum5 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_LayerNum5.Limits = [0 Inf];
            app.T_LayerNum5.ValueChangedFcn = createCallbackFcn(app, @T_LayerNum5ValueChanged, true);
            app.T_LayerNum5.Enable = 'off';
            app.T_LayerNum5.Position = [321 52 100 22];
            app.T_LayerNum5.Value = 4;

            % Create T_NozTemp5Lab
            app.T_NozTemp5Lab = uilabel(app.VaryNozzleTemperatureTab);
            app.T_NozTemp5Lab.HorizontalAlignment = 'right';
            app.T_NozTemp5Lab.Enable = 'off';
            app.T_NozTemp5Lab.Position = [182 23 124 22];
            app.T_NozTemp5Lab.Text = 'Nozzle temperature 5:';

            % Create T_NozTemp5
            app.T_NozTemp5 = uieditfield(app.VaryNozzleTemperatureTab, 'numeric');
            app.T_NozTemp5.Limits = [0 230];
            app.T_NozTemp5.Enable = 'off';
            app.T_NozTemp5.Position = [321 23 100 22];

            % Create ConfirmButton
            app.ConfirmButton = uibutton(app.VaryNozzleTemperatureTab, 'push');
            app.ConfirmButton.ButtonPushedFcn = createCallbackFcn(app, @ConfirmButtonPushed, true);
            app.ConfirmButton.Position = [508 23 100 22];
            app.ConfirmButton.Text = 'Confirm';

            % Create VaryPrintSpeedTab
            app.VaryPrintSpeedTab = uitab(app.TabGroup);
            app.VaryPrintSpeedTab.Title = 'Vary Print Speed';

            % Create S_LayerNum1Lab
            app.S_LayerNum1Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_LayerNum1Lab.HorizontalAlignment = 'right';
            app.S_LayerNum1Lab.Position = [223 330 83 22];
            app.S_LayerNum1Lab.Text = 'Layer number:';

            % Create S_LayerNum1
            app.S_LayerNum1 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_LayerNum1.Limits = [0 1];
            app.S_LayerNum1.Editable = 'off';
            app.S_LayerNum1.Position = [321 330 100 22];

            % Create S_PrintSpeed1Lab
            app.S_PrintSpeed1Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_PrintSpeed1Lab.HorizontalAlignment = 'right';
            app.S_PrintSpeed1Lab.Enable = 'off';
            app.S_PrintSpeed1Lab.Position = [206 302 100 22];
            app.S_PrintSpeed1Lab.Text = 'Initial print speed:';

            % Create S_PrintSpeed1
            app.S_PrintSpeed1 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_PrintSpeed1.Enable = 'off';
            app.S_PrintSpeed1.Position = [321 302 100 22];
            app.S_PrintSpeed1.Value = 50;

            % Create S_LayerNum2Lab
            app.S_LayerNum2Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_LayerNum2Lab.HorizontalAlignment = 'right';
            app.S_LayerNum2Lab.Enable = 'off';
            app.S_LayerNum2Lab.Position = [223 259 83 22];
            app.S_LayerNum2Lab.Text = 'Layer number:';

            % Create S_LayerNum2
            app.S_LayerNum2 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_LayerNum2.ValueChangedFcn = createCallbackFcn(app, @S_LayerNum2ValueChanged, true);
            app.S_LayerNum2.Enable = 'off';
            app.S_LayerNum2.Position = [321 259 100 22];
            app.S_LayerNum2.Value = 1;

            % Create S_PrintSpeed2Lab
            app.S_PrintSpeed2Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_PrintSpeed2Lab.HorizontalAlignment = 'right';
            app.S_PrintSpeed2Lab.Enable = 'off';
            app.S_PrintSpeed2Lab.Position = [226 230 80 22];
            app.S_PrintSpeed2Lab.Text = 'Print speed 2:';

            % Create S_PrintSpeed2
            app.S_PrintSpeed2 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_PrintSpeed2.Enable = 'off';
            app.S_PrintSpeed2.Position = [321 230 100 22];

            % Create S_LayerNum3Lab
            app.S_LayerNum3Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_LayerNum3Lab.HorizontalAlignment = 'right';
            app.S_LayerNum3Lab.Enable = 'off';
            app.S_LayerNum3Lab.Position = [223 189 83 22];
            app.S_LayerNum3Lab.Text = 'Layer number:';

            % Create S_LayerNum3
            app.S_LayerNum3 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_LayerNum3.ValueChangedFcn = createCallbackFcn(app, @S_LayerNum3ValueChanged, true);
            app.S_LayerNum3.Enable = 'off';
            app.S_LayerNum3.Position = [321 189 100 22];
            app.S_LayerNum3.Value = 2;

            % Create S_PrintSpeed3Lab
            app.S_PrintSpeed3Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_PrintSpeed3Lab.HorizontalAlignment = 'right';
            app.S_PrintSpeed3Lab.Enable = 'off';
            app.S_PrintSpeed3Lab.Position = [226 159 80 22];
            app.S_PrintSpeed3Lab.Text = 'Print speed 3:';

            % Create S_PrintSpeed3
            app.S_PrintSpeed3 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_PrintSpeed3.Enable = 'off';
            app.S_PrintSpeed3.Position = [321 159 100 22];

            % Create S_LayerNum4Lab
            app.S_LayerNum4Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_LayerNum4Lab.HorizontalAlignment = 'right';
            app.S_LayerNum4Lab.Enable = 'off';
            app.S_LayerNum4Lab.Position = [223 120 83 22];
            app.S_LayerNum4Lab.Text = 'Layer number:';

            % Create S_LayerNum4
            app.S_LayerNum4 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_LayerNum4.ValueChangedFcn = createCallbackFcn(app, @S_LayerNum4ValueChanged, true);
            app.S_LayerNum4.Enable = 'off';
            app.S_LayerNum4.Position = [321 120 100 22];
            app.S_LayerNum4.Value = 3;

            % Create S_PrintSpeed4Lab
            app.S_PrintSpeed4Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_PrintSpeed4Lab.HorizontalAlignment = 'right';
            app.S_PrintSpeed4Lab.Enable = 'off';
            app.S_PrintSpeed4Lab.Position = [226 91 80 22];
            app.S_PrintSpeed4Lab.Text = 'Print speed 4:';

            % Create S_PrintSpeed4
            app.S_PrintSpeed4 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_PrintSpeed4.Enable = 'off';
            app.S_PrintSpeed4.Position = [321 91 100 22];

            % Create S_LayerNum5Lab
            app.S_LayerNum5Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_LayerNum5Lab.HorizontalAlignment = 'right';
            app.S_LayerNum5Lab.Enable = 'off';
            app.S_LayerNum5Lab.Position = [223 52 83 22];
            app.S_LayerNum5Lab.Text = 'Layer number:';

            % Create S_LayerNum5
            app.S_LayerNum5 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_LayerNum5.ValueChangedFcn = createCallbackFcn(app, @S_LayerNum5ValueChanged, true);
            app.S_LayerNum5.Enable = 'off';
            app.S_LayerNum5.Position = [321 52 100 22];
            app.S_LayerNum5.Value = 4;

            % Create S_PrintSpeed5Lab
            app.S_PrintSpeed5Lab = uilabel(app.VaryPrintSpeedTab);
            app.S_PrintSpeed5Lab.HorizontalAlignment = 'right';
            app.S_PrintSpeed5Lab.Enable = 'off';
            app.S_PrintSpeed5Lab.Position = [226 23 80 22];
            app.S_PrintSpeed5Lab.Text = 'Print speed 5:';

            % Create S_PrintSpeed5
            app.S_PrintSpeed5 = uieditfield(app.VaryPrintSpeedTab, 'numeric');
            app.S_PrintSpeed5.Enable = 'off';
            app.S_PrintSpeed5.Position = [321 23 100 22];

            % Create ConfirmButton_2
            app.ConfirmButton_2 = uibutton(app.VaryPrintSpeedTab, 'push');
            app.ConfirmButton_2.ButtonPushedFcn = createCallbackFcn(app, @ConfirmButton_2Pushed, true);
            app.ConfirmButton_2.Position = [508 23 100 22];
            app.ConfirmButton_2.Text = 'Confirm';

            % Create ThisbuildhasXlayersLabel
            app.ThisbuildhasXlayersLabel = uilabel(app.TDfAMAppUIFigure);
            app.ThisbuildhasXlayersLabel.Position = [22 414 266 22];
            app.ThisbuildhasXlayersLabel.Text = 'This build has: X layers.';

            % Create appSectionNumLab
            app.appSectionNumLab = uilabel(app.TDfAMAppUIFigure);
            app.appSectionNumLab.HorizontalAlignment = 'right';
            app.appSectionNumLab.Position = [297 492 199 22];
            app.appSectionNumLab.Text = 'Number of varied sections to create:';

            % Create appSectionNum
            app.appSectionNum = uispinner(app.TDfAMAppUIFigure);
            app.appSectionNum.Limits = [1 5];
            app.appSectionNum.RoundFractionalValues = 'on';
            app.appSectionNum.ValueChangedFcn = createCallbackFcn(app, @appSectionNumValueChanged, true);
            app.appSectionNum.Position = [511 492 100 22];
            app.appSectionNum.Value = 1;

            % Create YouareeditingLabel
            app.YouareeditingLabel = uilabel(app.TDfAMAppUIFigure);
            app.YouareeditingLabel.Position = [22 492 266 22];
            app.YouareeditingLabel.Text = 'You are editing:';

            % Create ParametertovaryButtonGroup
            app.ParametertovaryButtonGroup = uibuttongroup(app.TDfAMAppUIFigure);
            app.ParametertovaryButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @nozOrSpeedButtonChange, true);
            app.ParametertovaryButtonGroup.Title = 'Parameter to vary:';
            app.ParametertovaryButtonGroup.Position = [297 409 314 72];

            % Create nozTempButton
            app.nozTempButton = uiradiobutton(app.ParametertovaryButtonGroup);
            app.nozTempButton.Text = 'Nozzle temperature (ºC)';
            app.nozTempButton.Position = [11 26 151 22];
            app.nozTempButton.Value = true;

            % Create printSpeedButton
            app.printSpeedButton = uiradiobutton(app.ParametertovaryButtonGroup);
            app.printSpeedButton.Text = 'Print speed (mm/s)';
            app.printSpeedButton.Position = [11 5 123 22];

            % Create SaveAsEditFieldLabel
            app.SaveAsEditFieldLabel = uilabel(app.TDfAMAppUIFigure);
            app.SaveAsEditFieldLabel.HorizontalAlignment = 'right';
            app.SaveAsEditFieldLabel.Position = [16 459 53 22];
            app.SaveAsEditFieldLabel.Text = 'Save As:';

            % Create SaveAsEditField
            app.SaveAsEditField = uieditfield(app.TDfAMAppUIFigure, 'text');
            app.SaveAsEditField.Position = [87 459 190 22];

            % Show the figure after all components are created
            app.TDfAMAppUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = appTDfAM_inputUI(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.TDfAMAppUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.TDfAMAppUIFigure)
        end
    end
end