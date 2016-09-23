classdef Currency < handle

% Please report bugs and inquiries to:
%
% Name       : Rody P.S. Oldenhuis
% E-mail     : oldenhuis@gmail.com    (personal)
%              oldenhuis@luxspace.lu  (professional)
% Affiliation: LuxSpace s�rl
% Licence    : BSD


% If you find this work useful, please consider a donation:
% https://www.paypal.me/RodyO/3.5


% TEST With 
% >> Currency(2000*rand(1,8,3))
    
    
    %% Properties
    
    properties (SetAccess = private)
       
        code   = 'EUR'
        symbol = char(8364);

    end
    
     properties (Access = private, Hidden)
        
        % The actual amount(s) 
        amount
        
        % ISO 4217 currency codes, names, and unicode symbols
        Currencies = {
            'ALL'   'Albania Lek'                               char([76, 101, 107])
            'AFN'   'Afghanistan Afghani'                       char(1547)
            'ARS'   'Argentina Peso'                            char(36)
            'AWG'   'Aruba Guilder'                             char(402)
            'AUD'   'Australia Dollar'                          char(36)
            'AZN'   'Azerbaijan New Manat'                      char([1084, 1072, 1085])
            'BSD'   'Bahamas Dollar'                            char(36)
            'BBD'   'Barbados Dollar'                           char(36)
            'BYR'   'Belarus Ruble'                             char([112, 46])
            'BZD'   'Belize Dollar'                             char([66, 90, 36])
            'BMD'   'Bermuda Dollar'                            char(36)
            'BOB'   'Bolivia Boliviano'                         char([36, 98])
            'BAM'   'Bosnia and Herzegovina Convertible Marka'  char([75, 77])
            'BWP'   'Botswana Pula'                             char(80)
            'BGN'   'Bulgaria Lev'                              char([1083, 1074])
            'BRL'   'Brazil Real'                               char([82, 36])
            'BND'   'Brunei Darussalam Dollar'                  char(36)
            'KHR'   'Cambodia Riel'                             char(6107)
            'CAD'   'Canada Dollar'                             char(36)
            'KYD'   'Cayman Islands Dollar'                     char(36)
            'CLP'   'Chile Peso'                                char(36)
            'CNY'   'China Yuan Renminbi'                       char(165)
            'COP'   'Colombia Peso'                             char(36)
            'CRC'   'Costa Rica Colon'                          char(8353)
            'HRK'   'Croatia Kuna'                              char([107, 110])
            'CUP'   'Cuba Peso'                                 char(8369)
            'CZK'   'Czech Republic Koruna'                     char([75, 269])
            'DKK'   'Denmark Krone'                             char([107, 114])
            'DOP'   'Dominican Republic Peso'                   char([82, 68, 36])
            'XCD'   'East Caribbean Dollar'                     char(36)
            'EGP'   'Egypt Pound'                               char(163)
            'SVC'   'El Salvador Colon'                         char(36)
            'EEK'   'Estonia Kroon'                             char([107, 114])
            'EUR'   'Euro Member Countries'                     char(8364)
            'FKP'   'Falkland Islands (Malvinas) Pound'         char(163)
            'FJD'   'Fiji Dollar'                               char(36)
            'GHC'   'Ghana Cedis'                               char(162)
            'GIP'   'Gibraltar Pound'                           char(163)
            'GTQ'   'Guatemala Quetzal'                         char(81)
            'GGP'   'Guernsey Pound'                            char(163)
            'GYD'   'Guyana Dollar'                             char(36)
            'HNL'   'Honduras Lempira'                          char(76)
            'HKD'   'Hong Kong Dollar'                          char(36)
            'HUF'   'Hungary Forint'                            char([70, 116])
            'ISK'   'Iceland Krona'                             char([107, 114])
            'INR'   'India Rupee'                               char(8377)
            'IDR'   'Indonesia Rupiah'                          char([82, 112])
            'IRR'   'Iran Rial'                                 char(65020)
            'IMP'   'Isle of Man Pound'                         char(163)
            'ILS'   'Israel Shekel'                             char(8362)
            'JMD'   'Jamaica Dollar'                            char([74, 36])
            'JPY'   'Japan Yen'                                 char(165)
            'JEP'   'Jersey Pound'                              char(163)
            'KZT'   'Kazakhstan Tenge'                          char([1083, 1074])
            'KPW'   'Korea (North) Won'                         char(8361)
            'KRW'   'Korea (South) Won'                         char(8361)
            'KGS'   'Kyrgyzstan Som'                            char([1083, 1074])
            'LAK'   'Laos Kip'                                  char(8365)
            'LVL'   'Latvia Lat'                                char([76, 115])
            'LBP'   'Lebanon Pound'                             char(163)
            'LRD'   'Liberia Dollar'                            char(36)
            'LTL'   'Lithuania Litas'                           char([76, 116])
            'MKD'   'Macedonia Denar'                           char([1076, 1077, 1085])
            'MYR'   'Malaysia Ringgit'                          char([82, 77])
            'MUR'   'Mauritius Rupee'                           char(8360)
            'MXN'   'Mexico Peso'                               char(36)
            'MNT'   'Mongolia Tughrik'                          char(8366)
            'MZN'   'Mozambique Metical'                        char([77, 84])
            'NAD'   'Namibia Dollar'                            char(36)
            'NPR'   'Nepal Rupee'                               char(8360)
            'ANG'   'Netherlands Antilles Guilder'              char(402)
            'NZD'   'New Zealand Dollar'                        char(36)
            'NIO'   'Nicaragua Cordoba'                         char([67, 36])
            'NGN'   'Nigeria Naira'                             char(8358)
            'KPW'   'Korea (North) Won'                         char(8361)
            'NOK'   'Norway Krone'                              char([107, 114])
            'OMR'   'Oman Rial'                                 char(65020)
            'PKR'   'Pakistan Rupee'                            char(8360)
            'PAB'   'Panama Balboa'                             char([66, 47, 46])
            'PYG'   'Paraguay Guarani'                          char([71, 115])
            'PEN'   'Peru Nuevo Sol'                            char([83, 47, 46])
            'PHP'   'Philippines Peso'                          char(8369)
            'PLN'   'Poland Zloty'                              char([122, 322])
            'QAR'   'Qatar Riyal'                               char(65020)
            'RON'   'Romania New Leu'                           char([108, 101, 105])
            'RUB'   'Russia Ruble'                              char([1088, 1091, 1073])
            'SHP'   'Saint Helena Pound'                        char(163)
            'SAR'   'Saudi Arabia Riyal'                        char(65020)
            'RSD'   'Serbia Dinar'                              char([1044, 1080, 1085, 46])
            'SCR'   'Seychelles Rupee'                          char(8360)
            'SGD'   'Singapore Dollar'                          char(36)
            'SBD'   'Solomon Islands Dollar'                    char(36)
            'SOS'   'Somalia Shilling'                          char(83)
            'ZAR'   'South Africa Rand'                         char(82)
            'KRW'   'Korea (South) Won'                         char(8361)
            'LKR'   'Sri Lanka Rupee'                           char(8360)
            'SEK'   'Sweden Krona'                              char([107, 114])
            'CHF'   'Switzerland Franc'                         char([67, 72, 70])
            'SRD'   'Suriname Dollar'                           char(36)
            'SYP'   'Syria Pound'                               char(163)
            'TWD'   'Taiwan New Dollar'                         char([78, 84, 36])
            'THB'   'Thailand Baht'                             char(3647)
            'TTD'   'Trinidad and Tobago Dollar'                char([84, 84, 36])
            'TRY'   'Turkey Lira'                               char(8356)
            'TVD'   'Tuvalu Dollar'                             char(36)
            'UAH'   'Ukraine Hryvna'                            char(8372)
            'GBP'   'United Kingdom Pound'                      char(163)
            'USD'   'United States Dollar'                      char(36)
            'UYU'   'Uruguay Peso'                              char([36, 85])
            'UZS'   'Uzbekistan Som'                            char([1083, 1074])
            'VEF'   'Venezuela Bolivar'                         char([66, 115])
            'VND'   'Viet Nam Dong'                             char(8363)
            'YER'   'Yemen Rial'                                char(65020)
            'ZWD'   'Zimbabwe Dollar'                           char([90, 36])
        };

    end
    
    %% Methods
    
    methods
        
        %% Currency constructor
        function this = Currency(varargin)
            % TODO
            
            this.amount = varargin{1};
            
        end
        
        %% Display
        function disp(this)
            
            % Just an abbreviation of an often-used construct
            uF = {'UniformOutput', false};
            
            % Construct display string
            dispstr = '';
            for ii = 1:numel(this)
            
                % Force two-digit display
                bankNotation = num2cell(round(this(ii).amount*100)/100);
                bankNotation = cellfun(@(x)num2str(x,'%.2f'), bankNotation, uF{:});
                
                % Add thousands separators
                bankNotation = cellfun(@(x,y) [fliplr(x), y(end-2:end)], ...
                    regexprep(...
                    cellfun(@(x) fliplr(x(1:end-3)), bankNotation, uF{:}),...
                    '([0-9]{3})(?=[0-9])', '$1,'), ...
                    bankNotation, uF{:});
                
                % Include currency symbol
                bankNotation = cellfun(@(x)[x ' ' this(ii).symbol], bankNotation, uF{:} );
                
                % Correct leading spacings
                sizes = cellfun('prodofsize', bankNotation);
                fieldLength = max(sizes(:));
                if ~all(sizes(:) - fieldLength == 0)
                    bankNotation = cellfun(@(x) ...
                        [repmat(' ', 1,fieldLength-numel(x)) x], bankNotation, uF{:});     %#ok
                end
                
                bankNotation
             aaa =   char( bankNotation)
                
                
                % Add new display string
%                 newStr  = regexp(regexprep(evalc('disp(bankNotation)'),'''',''),char(10),'split');
%                 newStr  = cat(1, newStr{~cellfun('isempty',newStr)});
                dispstr = char(dispstr, bankNotation{:});      
                
            end
                        
            % Correct trailing spacings
            % TODO
            
            % And display it
            dispstr = dispstr(2:end,:);           
            disp(dispstr)
            
        end
        
        %% Operators
                
        function new = times(this, other)
            % TODO
        end
        
        function new = rdivide(this, other)
            % TODO
        end
        
        function new = plus(this, other)
            % TODO
        end
        
        function new = minus(this, other)
            % TODO
        end
        
        function new = uplus(this, other)
            % TODO
        end
        
        function new = uminus(this, other)
            % TODO
        end
        
        
        % Aliases (matrix operations make little sense in this context)        
        function new = mtimes  (this, other), new = this .* other; end
        function new = mrdivide(this, other), new = this ./ other; end
        function new =  ldivide(this, other), new = this ./ other; end
        function new = mldivide(this, other), new = this ./ other; end
        
        
        
        %% Setters/getters
        
        function change(this, newCurrencyCode)
        end
        
        
    end
    
end
